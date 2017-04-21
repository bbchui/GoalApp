class GoalsController < ApplicationController
  def new
    render :new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    if @goal.save
      redirect_to goal_url(@goal)
    else
      flash[:errors] = "Invalid stuff"
      redirect_to new_goal_url
    end
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.finished == "Ongoing"
      @goal.finished = "Completed"
      @goal.save
    else
      @goal.finished = "Ongoing"
      @goal.save
    end
    redirect_to goal_url(@goal)
  end

  def destroy
  end

  def show
    @goal = Goal.find(params[:id])
    render :show
  end

  private

  def goal_params
    params.require(:goal).permit(:title, :details, :visibility, :finished, :user_id)
  end
end
