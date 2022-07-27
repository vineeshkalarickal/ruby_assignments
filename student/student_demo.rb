$LOAD_PATH << '.'
require 'student'
class StudentDemo
  def initialize
    student = Student.new
    details = Hash.new
    # select mod
    puts ' -------Select an Action--------'
    puts ' #1 => View Student Details '
    puts ' #2 => Add Student Details '
    action = gets.to_i
    check = false
    case action
    when 1
      puts 'Enter student Roll Number: '
      roll_num = gets.chomp
      student.display_stud_details(roll_num)
    when 2
      puts 'Enter Roll Number: '
      details['roll_number'] = gets.chomp.downcase
      check = student.check_stud_details(details['roll_number'])

      unless check == true
        puts 'Enter Name: '
        details['student_name'] = gets.chomp.to_s.downcase
        puts 'Enter no. of Subjects to record the Mark: '
        no_of_subs = gets.chomp.to_i
        details['marks'] = student.set_marks(no_of_subs)
        student.set_stud_details(details)
      end
    else
      puts "Unexpected value #{action} "
    end
  end
end

StudentDemo.new
