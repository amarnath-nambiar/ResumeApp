class GenerateEmployeeResume
  def initialize(user)
    @user = user
    @works = @user.works
  end

  def generate
    builder = ResumeBuilder.new(@user)
    resume_hash = { personal_info: builder.get_personal_info,
                   professional_info: get_professional_info,
                    academic_info: builder.get_academic_info
    }

    resume_hash
  end

  def get_professional_info
    professional_info = Hash.new
    @works.each_with_index do |work,idx|
      professional_info[idx] = {role: work.role,
                                company: work.company,
                                joined_at: work.join_date,
                                completion_date: work.completion_date
      }
    end

    professional_info
  end
end