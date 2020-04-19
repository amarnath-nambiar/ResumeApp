class ResumeBuilder

  def initialize(user)
    @user = user
    @educations = @user.educations
  end

  def genarate_resume
    if @user.is_a? Employee
      GenerateEmployeeResume.new(@user).generate
    elsif @user.is_a? Student
      GenerateStudentResume.new(@user).generate
    end
  end

  def get_personal_info
    {
        full_name: @user.full_name,
        email: @user.email,
        address: @user.address,
        phone: @user.phone,
        dob: @user.dob
    }
  end

  def get_academic_info
    academic_info = {}
    @educations.each_with_index do |edu,idx|
      academic_info[idx] = {
          college: edu.college,
          course: edu.course,
          joining_date: edu.joining_date,
          completion_date: edu.completion_date
      }
    end

    academic_info
  end

end