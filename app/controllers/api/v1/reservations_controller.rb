class Api::V1::ReservationsController < Api::V1::ApiController

  swagger_controller :reservations, " Reservations Controller"


  swagger_api :index do
    summary 'Lists all the reservations'
  end
  def index
    @reservations = Reservation.all
    render json: { meta: meta_response( 200 , 'all ok'), reservations: @reservations }
  end


  swagger_api :show do
    summary 'Show details of a reservation'

    param :path, :id, :integer, :required, "ID"
  end

  def show
    begin
      @reservation = Reservation.find(params[:id])

    rescue ActiveRecord::RecordNotFound
      render json: { meta: meta_response( 404, 'id doesn\'t exists'), reservation: @reservation}
      return
    end

    render json: { meta: meta_response( 200, 'all ok'), review: @reservation }
  end



  def new
    @reservation = Reservation.new
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end


  swagger_api :create do
    summary 'Create a new reservation'

    param :form, :customer_id, :integer, :required, "Customer ID"
    param :form, :hotel_id, :integer, :required, "Hotel ID"
    param :form, :no_of_persons, :integer, :required, "No of Persons"
    param :form, :from, :date, :required, "From"
    param :form, :to, :date, :required, "to"
    param :form, :comment, :string, :optional, "Comment"
  end

  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      render json: { meta: meta_response( 200, 'all ok'), reservation: @reservation}
    else
      render json: { meta: meta_response( 200, 'all ok'), reservation: @reservation}
    end
  end


  swagger_api :approve do
    summary 'Approves a reservation'

    param :form, :id, :integer, :required, "Reservation ID"
    param :form, :table_ids, :string, :required, "Table ID"
  end

  def approve
    begin
      @reservation = Reservation.find(params[:id])

    rescue ActiveRecord::RecordNotFound
      render json: { meta: meta_response( 404, 'id doesn\'t exists'), reservation: @reservation}
      return
    end

    isApproved = @reservation.approve( params[table_ids])
    # To Do
  end


  swagger_api :update do
    summary 'Update an existing reservation'

    param :path, :id, :integer, :required, "ID"
    param :form, :no_of_persons, :integer, :optional, "No Of Persons"
    param :form, :from, :date, :optional, "From"
    param :form, :to, :date, :optional, "To"
    param :form, :comment, :string, :optional, "Comment"
  end

  def update
    begin
      @reservation = Reservation.find(params[:id])

    rescue ActiveRecord::RecordNotFound
      render json: { meta: meta_response( 404, 'id doesn\'t exists'), reservation: @reservation}
      return
    end

    if @reservation.update(reservation_params)
      render json: { meta: meta_response( 200, 'all ok'), reservation: @reservation}
    else
      render json: { meta: meta_response( 500, 'Server error'), reservation: @reservation}
    end
  end


  swagger_api :cancel do
    summary 'Cancel an existing review'

    param :path, :id, :integer, :required, "ID"
  end

  def cancel
    begin
      @reservation = Reservation.find(params[:id])

    rescue ActiveRecord::RecordNotFound
      render json: { meta: meta_response( 404, 'id doesn\'t exists'), reservation: @reservation}
      return
    end

    # To Do
    if @reservation.update_attributes(status: :hotel_cancelled)
      render json: { meta: meta_response( 200, 'all ok'), reservation: @reservation}
    else
      render json: { meta: meta_response( 500, 'Server error'), reservation: @reservation}
    end

  end;

  swagger_api :destroy do
    summary "Deletes an existing reservation"
    param :path, :id, :integer, :optional, "ID"
  end

  def destroy
    begin
      @reservation = Reservation.find(params[:id])

    rescue ActiveRecord::RecordNotFound
      render json: { meta: meta_response( 404, 'id doesn\'t exists'), reservation: @reservation}
      return
    end

    if @reservation.destroy
      render json: { meta: meta_response( 200, 'all ok'), reservation: @reservation }
    else
      render json: { meta: meta_response( 500, 'Server error'), reservation: @reservation }
    end
  end

  private
  def reservation_params
    params.permit(:customer_id, :hotel_id, :from, :to, :comment, :table_ids, :no_of_persons);
  end
end
