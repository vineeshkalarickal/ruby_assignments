$LOAD_PATH << '.'
require 'date'
require 'IST_Formats'
require 'PST_Formats'

class DateOperations

  def get_user_inputs
    puts "Enter the date: "
    input_date = gets.chomp
    puts "Enter the number for the date format 1=> PST, 2=> IST, 3=> ORT : "
    input_type = gets.to_i
    if(input_type > 3)
      puts "Invalid choice "
      return
    else
      self.format_the_date(input_date,input_type)
    end
  end

  def format_the_date(date,type)
    @type = type
    case @type
      when 1
        puts "|----------|"
        PST_Formats.new(date)
      when 2
        puts "|----------|"
        IST_Formats.new(date)
      when 3
        puts "|----------|"
        dt = Date.parse(date)
        puts dt.strftime("%Y-%m-%d %H:%M:%S %z")
      else
        puts "|----------|"
        PST_Formats.new(date)
      end
    end
end


cls = DateOperations.new
cls.get_user_inputs