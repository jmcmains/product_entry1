class ProductCategoriesController < ApplicationController
	def create
		@product = Product.find(params[:product_category][:product_id])
		@category = Category.find(params[:product_category][:category_id])
		@product.product_categories.create!(:category_id =>params[:product_category][:category_id] )
		respond_to do |format|
			format.html { redirect_to @product }
			format.js
		end
	end
	
	def destroy
		@product = ProductCategory.find(params[:id]).product
		@category = ProductCategory.find(params[:id]).category
		@product.product_categories.find(params[:id]).destroy
		respond_to do |format|
			format.html { redirect_to @product }
			format.js
		end
	end
end
