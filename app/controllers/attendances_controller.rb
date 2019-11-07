class AttendancesController < ApplicationController
  def index
  end

  def new
  end

  def create
  	# Amount in cents
  	@amount = Event.find(params[:event_id]).price

  	customer = Stripe::Customer.create({
  	  email: params[:stripeEmail],
  	  source: params[:stripeToken],
  	})

  	attendance = Stripe::Charge.create({
  	  customer: customer.id,
  	  amount: @amount,
  	  description: 'Rails Stripe customer',
  	  currency: 'eur',
  	})
    
puts "$"*60
puts params
puts "$"*60


    @attendance = Attendance.new(user: current_user, event: Event.find(params[:event_id]), stripe_customer_id: attendance.customer)
    
    if attendance
      if @attendance.save
        flash[:success] = "Vous participez bien à l'événement !"
        redirect_to event_path(params[:event_id])
      else
        render :new
        flash[:danger] = @attendance.errors.messages
      end
    end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_event_attendance_path(params[:id])
  end
end
