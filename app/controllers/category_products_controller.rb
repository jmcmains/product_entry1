class CategoryProductsController < ApplicationController
	def create
		@product = Product.find(params[:product_category][:product_id])
		@category = Category.find(params[:product_category][:category_id])
		@category.category_products.create!(:product_id =>params[:product_category][:product_id] )
		respond_to do |format|
			format.html { redirect_to @category }
			format.js
		end
	end
	
	def destroy
		@product = Product.find(params[:product_category][:product_id])
		@category = Category.find(params[:product_category][:category_id])
		@product.product_categories.find_by_category_id(@category).destroy
		respond_to do |format|
			format.html { redirect_to @category }
			format.js
		end
	end
end
