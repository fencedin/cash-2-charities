class CreateCharities < ActiveRecord::Migration
  def change
    create_table :charities do |t|
      t.string :name
      t.text :description
      t.date :founded
      t.string :mission
      t.timestamps
    end
  end
end
