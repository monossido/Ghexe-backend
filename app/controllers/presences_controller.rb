class PresencesController < ApplicationController
  def new
    @presence = Presence.new
    @users = User.all
    @events = Event.all
  end

  def create
    @presence = Presence.new(presence_params)

    if @presence.save
      redirect_to admin_path
    else
      render "new"
    end
  end

  def destroy
    @presence = Presence.find(params[:id])
    @presence.destroy

    redirect_to admin_path
  end

  def show
    @presence = Presence.find(params[:id])
  end

  def index
    @presences = Presence.all
  end

  def edit
    @presence = Presence.find(params[:id])
  end

  def update
    @presence = Presence.find(params[:id])

    if @Presence.update(presence_params)
      redirect_to @presence
    else
      render 'edit'
    end
  end

  private
  def presence_params
    params.require(:presence).permit(:presence, :user_id, :event_id)
  end
end
