class CreateGolds < ActiveRecord::Migration
  def change
    create_table :golds do |t|
      t.string :date
      t.string :time
      t.float :price

      t.timestamps null: false
    end
  end
end
