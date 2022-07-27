# To calculate the total marks entered
module CalculateTotalMarks
  def my_sum(marks)
    marks.inject(:+)
  end
end