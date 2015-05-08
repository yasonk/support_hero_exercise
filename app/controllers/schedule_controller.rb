class ScheduleController < ApplicationController
  skip_before_action :verify_authenticity_token

  #used for swapping
  def assign_duty
    respond_to do |format|
      user = User.where(name: params[:user]).first
      user.support_assignments.create date: params[:date].to_date

      format.html do
        flash[:notice] = "Duty succesfully assigned."
        render 'schedule/index'
      end


    end
  end

  #shows full schedule
  def index
    @schedule = SupportAssignment.all.to_a
  end

  def todays_hero
    @schedule = SupportAssignment.where(date: Date.today).first
    render :todays_hero
  end

  def user_schedule
    user = User.where(name: params[:id]).first
    @schedule = SupportAssignment.where(user_id: user.id).to_a
    render :index
  end
end