class ReservationsController < ApplicationController

  before_action :permit_params, except: :new

	def index
		@reservations = Reservation.all
	end

	def new
		@reservation = Reservation.new
	end

	def back
		@reservation = Reservation.new(permit_params)
		render :new
	end

	def confirm
		@reservation = Reservation.new(permit_params)
		if @reservation.invalid?
			render :new
		end
	end

	def complete
		Reservation.create!(permit_params)
	end

	private

	def permit_params
		params.permit(:start_date, :finish_date, :ppl, :post_id)
	end

end
