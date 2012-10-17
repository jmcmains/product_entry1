class ProductExercisesController < ApplicationController
	def create
		@product = Product.find(params[:product_exercise][:product_id])
		@exercise = Exercise.find(params[:product_exercise][:exercise_id])
		@product.product_exercises.create!(:exercise_id =>params[:product_exercise][:exercise_id] )
		respond_to do |format|
			format.html { redirect_to @product }
			format.js
		end
	end
	
	def destroy
		@product = ProductExercise.find(params[:id]).product
		@exercise = ProductExercise.find(params[:id]).exercise
		@product.product_exercises.find(params[:id]).destroy
		respond_to do |format|
			format.html { redirect_to @product }
			format.js
		end
	end
end
