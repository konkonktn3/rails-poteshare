class ReservationsController < ApplicationController
	before_action :reservation_params, only: [:confirm]

  def index
		@reservations = Reservation.where(user_id: current_user.id)
	end

	def new
		@reservation = Reservation.new
		@post = params[:post_id]
	end

	def back
		@reservation = current_user.reservations.new(reservation_params)
		@post = params[:post_id]
		render :new
	end

	def confirm
		@reservation = current_user.reservations.new(reservation_params)
		@post = params[:post_id]
		@reservation.post_id = @post
		if @reservation.invalid?
			render :new
		end
	end

	def create
		@reservation = current_user.reservations.new(reservation_params)
		@post = params[:post_id]
		@reservation.post_id = @post
		if @reservation.save
      flash[:notice] = "予約が完了しました。"	
      redirect_to post_reservations_path
		else
			render :new
		end
	end

  def show
    @reservation = current_user.reservations.find(params[:id])
		@post = @reservation.post
	end

	def destroy
		@reservation = current_user.reservations.find(params[:id])
		@post = params[:post_id]
		@reservation.destroy
		flash[:notice] = "予約をキャンセルしました"
		redirect_to post_reservations_path
	end


	private

	def reservation_params
		params.require(:reservation).permit(:id, :start_date, :finish_date, :ppl, :user_id, :post_id)
	end

end
