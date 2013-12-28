class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.references :user, index: true
      t.references :course, index: true
      t.references :exam, index: true
      t.float :mark
      t.boolean :is_private, default: false

      t.timestamps
    end
  end
end
