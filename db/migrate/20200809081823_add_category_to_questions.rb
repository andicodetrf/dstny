class AddCategoryToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_reference :questions, :category, null: false, foreign_key: true
  end
end
