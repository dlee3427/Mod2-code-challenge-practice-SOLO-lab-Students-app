class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def new 
    @student = Student.new
  end 

  def create 
    @student = Student.new(student_params)
    if @student.valid? 
      @student.save
      redirect_to instructor_path(@student.instructor)
    else
      flash[:error] = @student.errors.full_messages
      redirect_to "/students/new"
    end
  end 

  def show 
    @student = Student.find(params[:id])
  end 

  def edit 
    @student = Student.find(params[:id])
  end 

  def update 
    @student = Student.find(params[:id])
    if @student.valid?
      @student.update(student_params)
      redirect_to student_path(@student)
    else
      render "edit"
    end 
  end 

  private 

  def student_params
    params.require(:student).permit(:name, :major, :age, :instructor_id)
  end 
  
end
