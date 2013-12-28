class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :description
      t.references :user, index: true
      t.references :course, index: true
      t.boolean :is_multiple_choice

      t.timestamps
    end
  end
end
