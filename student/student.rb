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







#Overall looks good
#Need to follow ruby/rails naming conventions
#please do follow Ruby naming conventions for creating method names like_this
#for calculating Student marks, please think of writing code with minimal changes for the future changes
#say for example what if the User wants add an extra subject and it's marks
#with the current approach, we need to change code at reading input/ initializing/ calculating total , in almost all stages
#you can use something likes this : [1,2,3].inject(0){|sum, marks| sum = sum + marks} instead of summing all of them individually
#and there is an *args param, think of it how we can use that in this scenario.


# appreciated using the CSV file reading/writing.

