module Api
<<<<<<< HEAD
  class PresencesController < ApiController
=======
  class PresencesController < ApplicationController
>>>>>>> 7cc049fc30505611072b7afce4fce3e7abb85011

    def create
      @presence = Presence.new(presence_params)

      if @presence.save
        render :show, status: :created
      else
        render json: @presence.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @presence = Presence.find(params[:id])
      @presence.destroy

      head :no_content
    end

    def show
      @presence = Presence.find(params[:id])
    end

    def index
      @presences = Presence.all
    end

    def update
      @presence = Presence.find(params[:id])

<<<<<<< HEAD
      if @presence.user.id == current_resource_owner.id
        if @presence.create_or_update(presence_params)
          render :show, status: :created
        else
          render json: @presence.errors, status: :unprocessable_entity
        end
      else
        render json: "error:true"
=======
      if @Presence.update(presence_params)
        render :show, status: :created
      else
        render json: @presence.errors, status: :unprocessable_entity
>>>>>>> 7cc049fc30505611072b7afce4fce3e7abb85011
      end
    end

    private
    def presence_params
      params.require(:presence).permit(:presence, :user_id, :event_id)
    end
  end
end
