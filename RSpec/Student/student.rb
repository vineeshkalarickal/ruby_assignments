class Student
  attr_accessor :first_name, :last_name, :roll_number, :branch, :college

  def initialize params
    @first_name = params[:first_name]
    @last_name = params[:last_name]
    @roll_number = params[:roll_number]
    @branch = params[:branch]
    @college = params[:college]
    @exams = []
  end

  def full_name
    first_name.capitalize + ' ' + last_name.capitalize
  end

  def valid?
    first_name && last_name ? true : false
  end

  def add_exams
    exams = [
      {subject: 'Signals & Systems', marks: 28},
      {subject: 'Radar Communications', marks: 32}
    ]
    @exams = exams
  end

  def mandatory_exams_taken?
    @exams.map{|exam| exam[:subject]}.include? 'Signals & Systems'
  end

  def total_marks
    @exams.map{|exam| exam[:marks]}.sum
  end
end