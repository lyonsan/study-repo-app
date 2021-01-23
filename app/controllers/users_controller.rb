class UsersController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @users = User.all.order(created_at: 'DESC')
  end
end
