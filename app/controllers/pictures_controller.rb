class PicturesController < ApplicationController
  def create
    @event = User.find(params[:event_id])
    @event.picture.attach(params[:picture])
    #redirect_to(event_path(@event))
  end
end
