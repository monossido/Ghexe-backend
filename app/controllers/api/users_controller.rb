module Api
  class UsersController < ApiController
    def show
      @user = User.find(params[:id])
    end
  end

  def index
    @users = User.all
  end
end
