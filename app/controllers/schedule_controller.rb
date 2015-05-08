class ScheduleController < ApplicationController

  #used for swapping
  def assign_duty user, date

  end

  #shows full schedule
  def index
    @schedule = SupportAssignment.all.to_a
  end

  def todays_hero

  end

  def user_schedule
    user = User.where(name: params[:id]).first
    @schedule = SupportAssignment.where(user_id: user.id).to_a
    render :index
  end
end