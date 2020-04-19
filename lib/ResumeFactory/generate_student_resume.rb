class GenerateStudentResume
  def initialize(user)
    @user = user
    @projects = @user.academic_projects
  end

  def generate
    builder = ResumeBuilder.new(@user)
    resume_hash = { personal_info: builder.get_personal_info,
                    project_info: get_project_info,
                    academic_info: builder.get_academic_info
    }

    resume_hash
  end

  def get_project_info
    project_info = Hash.new
    @projects.each_with_index do |project,idx|
      project_info[idx] = {title: project.title,
                           description: project.description,
                           role: project.role
      }
    end

    project_info
  end
end