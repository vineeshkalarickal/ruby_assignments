require 'date'

class IST_Formats
  def initialize(date)
    dt = Date.parse(date)
    puts "%-d %B, %Y => #{dt.strftime("%-d %B, %Y")}"
    puts "%-d %B, %Y %Z => #{dt.strftime("%-d %B, %Y %Z")}"
    puts "%d%m%Y => #{dt.strftime("%d%m%Y")}"
    puts "%d%m%Y%H%M%S => #{dt.strftime("%d%m%Y%H%M%S")}"
    puts "%d/%m/%Y => #{dt.strftime("%d/%m/%Y")}"
    puts "%d/%m/%y => #{dt.strftime("%d/%m/%y")}"
    puts "%d/%m/%Y %I:%M:%S %p => #{dt.strftime("%d/%m/%Y %I:%M:%S %p")}"
    puts "%d/%m/%Y %I %p => #{dt.strftime("%d/%m/%Y %I %p")}"
    puts "%d-%m-%Y %H:%M:%S %z => #{dt.strftime("%d-%m-%Y %H:%M:%S %z")}"
    puts "%d-%m-%Y %H:%M:%S %Z => #{dt.strftime("%d-%m-%Y %H:%M:%S %Z")}"
  end
end