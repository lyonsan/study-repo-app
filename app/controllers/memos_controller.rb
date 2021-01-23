class MemosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_subject
  before_action :set_memo, only: [:show, :edit, :update]
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

  def show
    redirect_to root_path unless user_signed_in? && @subject.user == current_user
  end

  def destroy
    memo = Memo.find(params[:id])
    memo.destroy
  end

  def edit
    redirect_to root_path unless user_signed_in? && @subject.user == current_user
  end

  def update
    render :edit unless @memo.update(memo_params)
  end

  def search
    redirect_to root_path unless user_signed_in? && @subject.user == current_user
    @subjects = Subject.where(user_id: current_user.id).where.not(id: params[:subject_id])
    @memos = Memo.search(params[:keyword]).where(subject_id: params[:subject_id]).order(created_at: 'DESC')
  end

  private

  def set_subject
    @subject = Subject.find(params[:subject_id])
  end

  def set_memo
    @memo = Memo.find(params[:id])
  end

  def memo_params
    params.require(:memo).permit(:topic, :image, :point, :explanation).merge(user_id: current_user.id)
  end
end
