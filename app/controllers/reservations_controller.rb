class ReservationsController < ApplicationController
  before_action :logged_in_user
	before_action :permit_params

	def index
		@reservations = current_user.current_post.reservations
	end

	def new
		@reservation = Reservation.new
	end

  def back
		@reservation = current_post.reservations.new(@attr)
		render :new
	end

	def confirm
		@reservation = current_post.reservations.new(@attr)
		@reservation.post_id =params[:post_id]
		if @reservation.save
		else
			render :new
		end
	end
	
	def create
		@reservation = current_post.reservations.create(@attr)
	end

	def show
		@reservation = current_user.current_post.reservations.find(params[:id])
	end

	private

	def permit_params
		@attr = params.require('reservation').permit(:start_date, :finish_date, :ppl).merge(user_id: current_user.id, post_id: current_post.id)
	end

end
