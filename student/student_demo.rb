$LOAD_PATH << '.'
require 'show_details'
require 'add_details'

class StudentDemo
  details = Array.new

  def initialize
    puts "Select an Action #1 => View Student Details #2 => Add Student Details"
    action = gets.to_i.chomp

    case action
    when 1
      puts "Enter student name: "
      name = gets.to_s.chomp
      search = ShowDetails.new(name)
    when 2
      puts "Enter student name: "
      deatils[] = gets.to_s.chomp
      search = ShowDetails.new(name)
    end

  end
end
