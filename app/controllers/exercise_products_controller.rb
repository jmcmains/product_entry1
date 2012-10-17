class ExerciseProductsController < ApplicationController
	def create
		@product = Product.find(params[:product_exercise][:product_id])
		@exercise = Exercise.find(params[:product_exercise][:exercise_id])
		@exercise.exercise_products.create!(:product_id =>params[:product_exercise][:product_id] )
		respond_to do |format|
			format.html { redirect_to @exercise }
			format.js
		end
	end
	
	def destroy
		@product = Product.find(params[:product_exercise][:product_id])
		@exercise = Exercise.find(params[:product_exercise][:exercise_id])
		@product.product_exercises.find_by_exercise_id(@exercise).destroy
		respond_to do |format|
			format.html { redirect_to @exercise }
			format.js
		end
	end
end
