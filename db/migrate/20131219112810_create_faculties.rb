class CreateFaculties < ActiveRecord::Migration
  def change
    create_table :faculties do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
