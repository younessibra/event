class EventsController < ApplicationController
  def index
    @events = Event.all
  end
  def new
    @event = Event.new
  end

  def create
    @event = Event.new('title' => params[:title], 
      'description' => params[:description],
      'duration' => params[:duration],
      'start_date' => params[:start_date],
      'price' => params[:price],
      'location' => params[:location])
    
    if @event.save
      flash[:success] = "Evènement créé !"
      redirect_to '/'
    else
      flash[:danger] = "Erreur dans la création de l'évènement"
      render '/events/new'
    end

  end


  def show
    @event = Event.find(params[:id])
  end


end
