require 'csv'
require './calculate_total_marks'
class Student
  attr_accessor :roll_num, :stud_name, :mark1, :mark2, :mark3, :total_mark, :file_name
  $file_name = 'student_data.csv'
  include CalculateTotalMarks
  def display_stud_details(roll_num)
    csv = CSV.read($file_name, :headers => true)
    puts '-------Student Details--------- '
    csv.find do |row|
      if row['ROLL_NUM'] == roll_num   
        print "Name: #{row['STUD_NAME'].upcase} \n"
        print "Roll Number: #{row['ROLL_NUM'].upcase} \n"
        print "Total Mark: #{row['TOTAL']} \n"
      end
    end
  end

  def set_marks(number_of_subjects)
    @marks = []
    @marks_ar = []
    total = []
    for i in 0..(number_of_subjects-1) do
      puts "Enter the mark of Subject #{i+1}: "
      @marks[i] = gets.to_i
    end
    @marks.each do |single|
      @marks_ar.push single
    end

    total[0] = @marks_ar
    total[1] = my_sum(@marks)
    return total
  end

  def set_stud_details(stud_details)
    puts stud_details
    File.open($file_name, 'a+') do |fo|
      stud_details.each do |key, value|
        if key == 'marks'
          fo.print "#{value[1]},#{value[0]}"
        else
          fo.print "#{value},"
        end
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
