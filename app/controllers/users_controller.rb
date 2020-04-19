class UsersController < ApplicationController
  require 'ResumeFactory/generate_employee_resume'
  require 'ResumeFactory/generate_student_resume'
  require 'ResumeFactory/resume_builder'

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @educations = @user.educations
    @academic_projects = @user.academic_projects  if @user.is_a? Student
    @works  = @user.works if @user.is_a? Employee
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    # @user = User.new(user_params)
    if user_params[:type] == "Employee"
      @user = Employee.new(user_params)
    elsif user_params[:type] == "Student"
      @user = Student.new(user_params)
    end

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def generate_resume
    @user = User.find(params[:id])
    @resume_hash = ResumeBuilder.new(@user).genarate_resume
    render json: @resume_hash.to_json
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :phone, :dob, :address, :type)
    end
end
