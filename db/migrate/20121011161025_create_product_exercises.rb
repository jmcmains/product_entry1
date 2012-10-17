class CreateProductExercises < ActiveRecord::Migration
  def change
    create_table :product_exercises do |t|
      t.integer :product_id
      t.integer :exercise_id

      t.timestamps
    end
  end
end
