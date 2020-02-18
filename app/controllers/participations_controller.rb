class ParticipationsController < ApplicationController
  #mettre test si il peut s'inscrire
  
  def new
    @event = Event.find(params[:id])
  end
  
  def create
    @event = Event.find(params[:id])
    puts "*" * 50
    puts @event.id
    puts current_user.id
    puts "*" * 50
    a = Attendance.create(stripe_customer_id: "test pour stripe",user: current_user, event: @event)

  	flash[:success] = "Vous êtes inscrits à l'évènement"
    redirect_to event_path(id: @event.id)
  end

  def index
    #@event = Event.find(params[:id])
    @attendees = Attendance.where(event_id: @event.id) #pour test event_id = 75
    puts "*" * 50
    puts @event.id
    puts current_user.id
    puts @attendees.inspect
    puts "*" * 50
  end
end
