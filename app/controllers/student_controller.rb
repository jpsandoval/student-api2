class StudentController < ApplicationController
  def create
      @student = Student.new(student_params)
      if @student.save
        render json: @student
      else
        render json: @student.errors, status: :unprocessable_entity
      end
  end

  def index
    @all_students = Student.all
    render json:@all_students
  end

  def show
    @student = Student.find(params[:id])
    render json: @student
  end
  def update
    student = Student.find(params[:id])
    if student.update(student_params)
      render json: student
    else
      render json: { errors: student.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
  end

  def filter
    @students = Student.where("score = ?", params[:score])
    render json: @students
  end
  
  def student_params
    params.require(:student).permit(:name, :score)
  end
end
