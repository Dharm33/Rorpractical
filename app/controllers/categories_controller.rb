class CategoriesController < ApplicationController

	def index
		categories = Category.all
		render json: { products: categories}
	end

	def create
		category = Category.new(category_params)
		if category.save
			render json: {status: 201, category: category}
		else
			render json: { status: 406, category: category, errors: category.errors }
	  end
	end

	def update
	  category = Category.find(params[:id])
		if category.update(category_params)
			render json: { status: 200, category: category }
		else
      render json: { status: 406, category: category, errors: category.errors }
		end
	end

	def show
  	category = Category.find(params[:id])
  	render json: category
	end

	def destroy
		category = Category.find(params[:id])
		if category.destroy
			render json: { status: 200 }
		else
			render json: { status: 406,
				errors: 'product not found' }
		end
	end

	private
	def category_params
		params.require(:category).permit(:name)
	end
end
