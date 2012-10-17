class RelatedProductsController < ApplicationController
	def create
		@follower = Product.find(params[:related_product][:follower_id])
		@followed = Product.find(params[:related_product][:followed_id])
		@follower.related_products.create!(:followed_id =>params[:related_product][:followed_id] )
		@followed.related_products.create!(:followed_id =>params[:related_product][:follower_id] )
		respond_to do |format|
			format.html { redirect_to @follower }
			format.js
		end
	end
	
	def destroy
		@follower = RelatedProduct.find(params[:id]).follower
		@followed = RelatedProduct.find(params[:id]).followed
		@follower.related_products.find(params[:id]).destroy
		respond_to do |format|
			format.html { redirect_to @follower }
			format.js
		end
	end
end
