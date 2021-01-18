class MemosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_subject, only: [:index, :new, :create]
  def index
    redirect_to root_path unless user_signed_in? && @subject.user_id == current_user.id
    @memos = @subject.memos.includes(:user).order(created_at: 'DESC')
    @subjects = Subject.where(user_id: current_user.id).where.not(id: params[:subject_id])
    # @subjects = Subject.where(user_id: current_user.id).where.not(params[:subject_id])
  end

  def new
    redirect_to root_path unless user_signed_in? && @subject.user == current_user
    @memo = Memo.new
  end

  def create
    @memo = @subject.memos.new(memo_params)
    render :new unless @memo.save
  end

  private

  def set_subject
    @subject = Subject.find(params[:subject_id])
  end

  def memo_params
    params.require(:memo).permit(:topic, :image, :point, :explanation).merge(user_id: current_user.id)
  end
end
