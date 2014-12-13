class AdminController < ApplicationController
  def index
    @users = User.all
    @events = Event.all
    @presences = Presence.all
  end
end
