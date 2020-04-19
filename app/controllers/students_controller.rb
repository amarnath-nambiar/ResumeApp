class StudentsController < ApplicationController
  def index
  end

  def show
    redirect_to :controller => 'users', :action => 'show'
  end

  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
