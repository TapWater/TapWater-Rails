class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :category
      t.integer :user_id
      t.string :uuid
      t.datetime :drink_date

      t.timestamps
    end
  end
end
