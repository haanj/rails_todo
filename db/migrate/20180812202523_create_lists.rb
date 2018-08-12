class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.text :description
      t.string :name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
