class ScheduleController < ApplicationController

  #used for swapping
  def assign_duty
    date = params[:date].to_date
    respond_to do |format|
      user = User.where(name: params[:user]).first
      if user.available? date
        user.assign_duty date

        format.html do
          @schedule = Schedule.new.full_schedule
          render 'schedule/index'
        end
      else
        format.html do
          render :html => "#{user.name} is not available on #{date}" and return
        end
      end
    end
  end

  #shows full schedule
  def index
    @schedule = Schedule.new.full_schedule
  end

  def todays_hero
    @schedule = Schedule.new.assignment_for_date Date.today
    render :todays_hero
  end

  def user_schedule
    @schedule = Schedule.new.user_schedule params[:id]
    render :index
  end
end