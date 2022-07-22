require 'date'

class PST_Formats
  def initialize(date)
    dt = Date.parse(date)
    puts "%B %-d, %Y => #{dt.strftime("%B %-d, %Y")}"
    puts "%B %-d, %Y %Z => #{dt.strftime("%B %-d, %Y %Z")}"
    puts "%m%d%Y => #{dt.strftime("%m%d%Y")}"
    puts "%m%d%Y%H%M%S => #{dt.strftime("%m%d%Y%H%M%S")}"
    puts "%m/%d/%Y => #{dt.strftime("%m/%d/%Y")}"
    puts "%m/%d/%Y => #{dt.strftime("%m/%d/%Y")}"
    puts "%m/%d/%Y %I:%M:%S %p => #{dt.strftime("%m/%d/%Y %I:%M:%S %p")}"
    puts "%m/%d/%Y %I %p => #{dt.strftime("%m/%d/%Y %I %p")}"
    puts "%m-%d-%Y %H:%M:%S %z => #{dt.strftime("%m-%d-%Y %H:%M:%S %z")}"
    puts "%m-%d-%Y %H:%M:%S %Z => #{dt.strftime("%m-%d-%Y %H:%M:%S %Z")}"
  end
end