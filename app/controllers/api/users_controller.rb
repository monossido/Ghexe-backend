module Api
<<<<<<< HEAD
  class UsersController < ApiController
=======
  class UsersController < ApplicationController
>>>>>>> 7cc049fc30505611072b7afce4fce3e7abb85011
    def show
      @user = User.find(params[:id])
    end
  end

  def index
    @users = User.all
  end
end
