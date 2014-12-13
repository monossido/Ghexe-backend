module Api
  class UsersController < ApplicationController
    def show
      @user = User.find(params[:id])
    end
  end

  def index
    @users = User.all
  end
end
