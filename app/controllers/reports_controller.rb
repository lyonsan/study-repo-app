class ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: [:index, :new, :create]
  def index
    redirect_to root_path unless user_signed_in? && @room.users.include?(current_user)
    @reports = @room.reports.includes(:user).order(created_at: 'DESC')
  end

  def new
    redirect_to root_path unless user_signed_in? && @room.users.include?(current_user)
    @report = Report.new
  end

  def create
    @report = @room.reports.new(report_params)
    render :new unless @report.save
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def report_params
    params.require(:report).permit(:study_time, :concentrated_time, :good_way, :achieved, :go_wrong, :tomorrow_plan,
                                   :study_content, :advice).merge(user_id: current_user.id)
  end
end
