class ReservationsController < ApplicationController
	
	before_action :permit_params, except: :new

	def new
		@reservation = Reservation.new
	end

	def back
		@reservation = Reservation.new(@attr)
		render :new
	end

	def confirm
		@reservation = Reservation.new(@attr)
		if @reservation.invalid?
			render :new
		end
	end

	def complete
		Reservation.create!(@attr)
	end

	private

	def permit_params
		@attr = params.require('reservation').permit(:id, :start_date, :finish_date, :ppl)
	end

end
