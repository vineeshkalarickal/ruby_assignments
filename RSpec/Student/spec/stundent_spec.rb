require_relative '../student'

describe Student do
  describe "columns" do 
    it "should have a column called first_name" do 
      expect(Student.new({}).respond_to?(:first_name)).to be true
    end
  end


  describe "columns" do 
    it "should give the full name" do 
      expect(Student.new({first_name: 'rama', last_name: 'krishna'}).respond_to?(:full_name)).to be true
      expect(Student.new({first_name: 'rama', last_name: 'krishna'}).full_name).to eq('Rama Krishna')
    end
  end

  describe "Validations" do 
    it "should check wether student is valid?" do 
      expect(Student.new({first_name: 'rama', last_name: 'krishna'}).respond_to?(:valid?)).to be true
      expect(Student.new({first_name: 'rama', last_name: 'krishna'}).valid?).to be true
    end

    it "should check wether student is valid?" do 
      expect(Student.new({first_name: 'rama', last_name: 'krishna'}).respond_to?(:valid?)).to be true
      expect(Student.new({first_name: 'rama'}).valid?).to be false
    end
  end

  describe "Behaviour" do 
    it "should check wether has taken required exams" do 
      student  = Student.new({})
      student.add_exams
      expect(student.total_marks).to eq(60)
    end

    it "should check wether has taken required exams" do 
      student  = Student.new({})
      student.add_exams
      expect(student.mandatory_exams_taken?).to be true
    end
  end

end