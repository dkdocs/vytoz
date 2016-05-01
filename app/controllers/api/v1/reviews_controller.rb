class Api::V1::ReviewsController < Api::V1::ApiController


  swagger_controller :reviews, " Reviews Controller"


  swagger_api :index do
    summary 'Lists all the reviews'
  end

  def index
    @reviews = Review.all
    render json: { meta: meta_response( 200 , 'all ok'), reviews: @reviews }
  end


  swagger_api :show do
    summary 'Show details of a review'

    param :path, :id, :integer, :required, "ID"
  end

  def show
    begin
      @review = Review.find(params[:id])

    rescue ActiveRecord::RecordNotFound
      render json: { meta: meta_response( 404, 'id doesn\'t exists'), review: @review}
      return
    end

    render json: { meta: meta_response( 200, 'all ok'), review: @review }
  end


  def new
    @review = Review.new
  end

  def edit
    @review = Review.find(params[:id])
  end


  swagger_api :create do
    summary 'Create a new review'

    param :form, :title, :string, :required, "Title"
    param :form, :review, :string, :required, "Review"
    param :form, :rating, :integer, :required, "Rating"
    param :form, :hotel_id, :integer, :required, "Hotel ID"
    param :form, :customer_id, :integer, :required, "Customer ID"
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      render json: { meta: meta_response( 200, 'all ok'), review: @review}
    else
      render json: { meta: meta_response( 500, 'Server Error'), review: @review}
    end
  end


  swagger_api :update do
    summary 'Update an existing review'

    param :path, :id, :integer, :required, "ID"
    param :form, :title, :string, :optional, "Title"
    param :form, :review, :string, :optional, "Review"
    param :form, :rating, :integer, :optional, "Rating"
  end

  def update
    begin
      @review = Review.find(params[:id])

    rescue ActiveRecord::RecordNotFound
      render json: { meta: meta_response( 404, 'id doesn\'t exists'), review: @review}
      return
    end

    if @review.update(review_params)
      render json: { meta: meta_response( 200, 'all ok'), review: @review}
    else
      render json: { meta: meta_response( 500, 'Server error'), review: @review}
    end
  end


  swagger_api :destroy do
    summary "Deletes an existing review"
    param :path, :id, :integer, :optional, "ID"
  end

  def destroy
    begin
      @review = Review.find(params[:id])

    rescue ActiveRecord::RecordNotFound
      render json: { meta: meta_response( 404, 'id doesn\'t exists'), review: @review}
      return
    end
    if @review.destroy
      render json: { meta: meta_response( 200, 'all ok'), review: @review}
    else
      render json: { meta: meta_response( 500, 'Server error'), review: @review}
    end

  end

  private
  def review_params
    params.permit(:title, :review, :rating, :hotel_id, :customer_id)
  end
end
