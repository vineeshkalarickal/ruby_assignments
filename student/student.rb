require 'csv'
require './calculate_total_marks'
class Student
  attr_accessor :roll_num, :stud_name, :mark1, :mark2, :mark3, :total_mark, :file_name
  $file_name = 'student_data.csv'
  include CalculateTotalMarks
  def display_stud_details(roll_num)
    csv = CSV.read($file_name, :headers => true)
    csv.find do |row|
      if row['ROLL_NUM'] == roll_num
        total_mark = row['MARK']
        puts '-------Student Details---------'
        puts "Name: #{row['STUD_NAME'].upcase}"
        puts "Roll Number: #{row['ROLL_NUM'].upcase}"
        puts "Total Mark Scored: #{total_mark}"
        puts "\n\n"
      end
    end
  end

  def set_marks(number_of_subjects)
    marks = []
    for i in 0..(number_of_subjects-1) do
      puts "Enter the mark of Subject #{i+1}: "
      marks[i] = gets.to_i
    end

    total = my_sum(marks)
  end

  def set_stud_details(stud_details)
    puts stud_details
    File.open($file_name, 'a+') do |fo|
      stud_details.each do |key, value|
        fo.print "#{value},"
      end
      fo.puts
    end
  end

  def check_stud_details(roll_num)
    csv = CSV.read($file_name, :headers => true)
    csv.find do |row|
      if row['ROLL_NUM'] == roll_num        
        puts '-------Student Details Already Exists---------'
        return true
      end
    end
  end
end
