class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index, :details]
  def index
  end

  def details
  end
end
