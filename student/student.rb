require 'csv'
class Student
  attr_accessor :roll_num, :stud_name, :mark1, :mark2, :mark3, :total_mark, :file_name
  $file_name = 'student_data.csv'

  def display_stud_details(roll_num)
    csv = CSV.read($file_name, :headers => true)
    csv.find do |row|
      if row['ROLL_NUM'] == roll_num
        total_mark = self.calculate_total(row['MARK1'], row['MARK2'], row['MARK3'])
        puts "\n -------Student Details--------- \n "
        puts "Name: #{row['STUD_NAME'].upcase}"
        puts "Roll Number: #{row['ROLL_NUM'].upcase}"
        puts "Total Mark Scored: #{total_mark}"
        puts "\n\n"
      end
    end
  end

  def calculate_total(mark1, mark2, mark3)
    mark1.to_i + mark2.to_i + mark3.to_i
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
        puts "\n -------Student Details Already Exists--------- \n "
        return true
      else
        return false
      end
    end
  end
end
