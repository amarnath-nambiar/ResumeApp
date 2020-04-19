class AcademicProjectsController < ApplicationController
  before_action :set_academic_project, only: [:show, :edit, :update, :destroy]

  # GET /academic_projects
  # GET /academic_projects.json
  def index
    @academic_projects = AcademicProject.all
  end

  # GET /academic_projects/1
  # GET /academic_projects/1.json
  def show
  end

  # GET /academic_projects/new
  def new
    @academic_project = AcademicProject.new
  end

  # GET /academic_projects/1/edit
  def edit
  end

  # POST /academic_projects
  # POST /academic_projects.json
  def create
    @academic_project = AcademicProject.new(academic_project_params)

    respond_to do |format|
      if @academic_project.save
        format.html { redirect_to @academic_project, notice: 'Academic project was successfully created.' }
        format.json { render :show, status: :created, location: @academic_project }
      else
        format.html { render :new }
        format.json { render json: @academic_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /academic_projects/1
  # PATCH/PUT /academic_projects/1.json
  def update
    respond_to do |format|
      if @academic_project.update(academic_project_params)
        format.html { redirect_to @academic_project, notice: 'Academic project was successfully updated.' }
        format.json { render :show, status: :ok, location: @academic_project }
      else
        format.html { render :edit }
        format.json { render json: @academic_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /academic_projects/1
  # DELETE /academic_projects/1.json
  def destroy
    @academic_project.destroy
    respond_to do |format|
      format.html { redirect_to academic_projects_url, notice: 'Academic project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_academic_project
      @academic_project = AcademicProject.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def academic_project_params
      params.require(:academic_project).permit(:title, :description, :role, :student_id)
    end
end
