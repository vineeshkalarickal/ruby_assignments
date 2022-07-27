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
      details['rollNum'] = gets.chomp.downcase
      puts 'Enter Name: '
      details['studName'] = gets.chomp.to_s.downcase
      puts 'Enter 1st Subject Mark: '
      details['mark1'] = gets.chomp.to_i
      puts 'Enter 2nd Subject Mark: '
      details['mark2'] = gets.chomp.to_i
      puts 'Enter 3rd Subject Mark: '
      details['mark3'] = gets.chomp.to_i
      check = student.check_stud_details(details['rollNum'])
      if check == false
        student.set_stud_details(details)
      end
    else
      puts "Unexpected value #{action} "
    end
  end
end

StudentDemo.new
