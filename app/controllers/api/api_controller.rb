module Api
  class ApiController < ApplicationController
    doorkeeper_for :all # Require access token for all actions
    doorkeeper_for :me,    :scopes => [:user]
    respond_to :json
    protect_from_forgery with: :null_session

    def me
      respond_with current_resource_owner
    end

    private

    # Find the user that owns the access token
    def current_resource_owner
      User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
    end
  end
end
