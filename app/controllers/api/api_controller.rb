module Api
  class ApiController < ApplicationController
    doorkeeper_for :all # Require access token for all actions
    doorkeeper_for :me,    :scopes => [:user]
    respond_to :json
    skip_before_filter  :verify_authenticity_token

    def me
      respond_with current_resource_owner
    end

    def me_update
        if current_resource_owner.update(user_params)
          redirect_to current_resource_owner
        else
          render 'edit'
        end
    end

    private
    # Find the user that owns the access token
    def current_resource_owner
      User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
    end

    def user_params
      params.require(:user).permit(:gcm)
    end
  end
end
