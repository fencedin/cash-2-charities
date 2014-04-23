class ChargesController < ApplicationController

  def create
    Stripe.api_key = ENV['SECRET_KEY']
    @amount = params[:amount_pay]
    @charity = Charity.find(params[:charity_id])
    customer = Stripe::Customer.create(
      :email => current_user.email,
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => @charity.name,
      :currency    => 'usd'
    )

  redirect_to root_path

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to charity_path(@charity)
  end

end
