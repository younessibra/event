class ChargesController < ApplicationController
  # une fois payé retour sur l'event
  # after_create: faire attendance.create (avec event.id, current_user.id et strip number)
  
  def new
    @event = Event.find(params[:id])
  end
  
  def create
    @event = Event.find(params[:id])
    # Amount in cents
    @amount = @event.price * 100
    
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd',
    })

    a = Attendance.create(stripe_customer_id: customer.id, user: current_user, event: @event)
	  puts "*"*100
	  puts a
    puts "*"*100
    
    if a != nil
      flash[:success] = "Vous êtes inscrits"
      redirect_to event_path(id: @event.id)
    else 
      flash[:danger] = "Un problème lors votre inscritpion est survenue"
      redirect_to new_charge_path(id: @event.id)
    end

  

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
