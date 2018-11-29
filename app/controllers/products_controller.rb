class ProductsController < ApplicationController
	
	def index
		products = Product.all
		render json: { products: products}
	end
     
	def create

		category = Category.find(params[:category_id])
		product = category.products.new(product_params)
		if product.save
			render json: { status: 201, product: product }
		else
			render json: { status: 406, product: product, errors: product.errors }
    end
  end
	

	def update
		category = Category.find(params[:category_id])
    product = category.products.find(params[:id])
      if product.update(product_params)        
        render json: { status: 200, product: product }
      else
        render json: { status: 406, product: product, errors: product.errors }
    end
  end

  def show
  	product = Product.find(params[:id])
  	render json: product
  end

  def destroy
  	category = Category.find(params[:id])
  	product = category.products.find(params[:id])
  	if product.destroy
  		render json: { status: 200 }
  	else
  		render json: { status: 406,
                       errors: 'product not found' }
    end
  end
 
	private
	def product_params
    params.require(:product).permit(:name, :price, :quantity, :category_id, :product_image, :product_image_gallery)
	end
end
