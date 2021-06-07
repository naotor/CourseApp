class PlansController < ApplicationController
  before_action :set_course

  def index
  end

  def new
    @plan = @course.plans.new
  end

  def create
    @plan = @course.plans.new(plan_params)

    if @plan.save
      redirect_to course_plans_path(@course)
    else
      render :new
    end
  end

  def edit
    @plan = @course.plans.find(params[:id])
  end

  def update
    @plan = @course.plans.find(params[:id])

    if @plan.update(plan_params)
      redirect_to course_plans_path(@course)
    else
      render :edit
    end
  end

  def destroy
    @plan = @course.plans.find(params[:id])
    @plan.destroy
    redirect_to course_plans_path(@course)
  end

  private
  def set_course
    @course = Course.find(params[:course_id])
  end

  def plan_params
    params
      .require(:plan)
      .permit(%i(
        title
        body
      ))
  end
end
