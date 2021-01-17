class SubjectsController < ApplicationController
  def index
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)
    render :new unless @subject.save
  end

  private
  def subject_params
    params.require(:subject).permit(:name, :purpose_subject).merge(user_id: current_user.id)
  end

end
