class HomeController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
  end

  def show
  end
end
