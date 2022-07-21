require 'csv'

class Student
  attr_accessor :rollNum, :studName, :mark1, :mark2, :mark3, :totalMarks, :fileName
  $fileName = 'student_data.csv'

  def displayStudDetails(rollNum)
    csv = CSV.read($fileName, :headers => true)
    csv.find do |row| 
      if row['ROLL_NUM'] == rollNum 
        totalMarks = self.calculateTotal(row['MARK1'],row['MARK2'],row['MARK3'])
        puts "\n -------Student Details--------- \n "
        puts "Name: #{row['STUD_NAME'].upcase} | Roll Number: #{row['ROLL_NUM'].upcase} | Total Mark Scored: #{totalMarks}"
        puts "\n\n"
      end
    end
  end

  def calculateTotal(mark1,mark2,mark3)
    totalMarks = mark1.to_i+mark2.to_i+mark3.to_i
  end

  def setStudDetails(studDetails)
    puts studDetails
    File.open($fileName, 'a+') do |fo|
      studDetails.each do |key, value|
          fo.print "#{value},"          
      end
      fo.puts 
    end
  end

  def checkStudDetail(roll_num)
    csv = CSV.read($fileName, :headers => true)
    csv.find do |row|     
      if row['ROLL_NUM'] == roll_num 
        puts "\n -------Student Details Already Exists--------- \n "
        return true
      end
    end
  end


end
