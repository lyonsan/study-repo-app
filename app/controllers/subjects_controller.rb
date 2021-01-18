class SubjectsController < ApplicationController
  before_action :authenticate_user!
  def index
    @subjects = Subject.all.order(created_at: 'DESC')
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)
    render :new unless @subject.save
  end

  def destroy
    subject = Subject.find(params[:id])
    subject.destroy
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :purpose_subject).merge(user_id: current_user.id)
  end
end
