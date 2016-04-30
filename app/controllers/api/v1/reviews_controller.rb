class Api::V1::ReviewsController < Api::V1::ApiController


  swagger_controller :reviews, " Reviews Controller"




  swagger_api :index do
    summary 'Lists all the reviews'
  end

  def index
    @reviews = Review.all
    render json: { meta: meta_response( '200', 'all ok'), reviews: @reviews }
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def edit
    @review = Review.find(params[:id])
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      redirect_to @review
    else
      render 'new'
    end
  end

  def update
    @review = Review.find(params[:id])

    if @review.update(review_params)
      redirect_to @review
    else
      render 'edit'
    end
  end

  def destroy
    @review = Review.find(params[:id])
   

    redirect_to reviews_path
  end

  private
  def review_params
    params.require(:review).permit(:title, :review, :hotel_id, :menu_item_id, :customer_id);
  end
end
