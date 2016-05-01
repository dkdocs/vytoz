class Api::V1::ReservationsController < AApi::V1::ApiController
	
	def index
		@reservations = Reservation.all
	end

	def show
		@reservation = Reservation.find(params[:id])
	end

	def new
		@reservation = Reservation.new
	end

	def edit
		@reservation = Reservation.find(params[:id])
	end

	def create
		@reservation = Reservation.new(reservation_params)

		if @reservation.save
			redirect_to @reservation
		else
			render 'new'
		end
	end

	def update
		@reservation = Reservation.find(params[:id])

		if @reservation.update(reservation_params)
			redirect_to @reservation
		else
			render 'edit'
		end
	end

	def cancel
		@reservation = Reservation.find(params[:id])
		@reservation.status = "hotel_cancelled"
		@reservation.save

		@table = Table.find(@reservation.table_id)
		@table.status = false
		@table.save
	end;

	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy

		redirect_to reservations_path
	end

	private
		def reservation_params
			params.require(:reservation).permit(:customer_id, :hotel_id, :table_id, :status, :comment);
		end
end
