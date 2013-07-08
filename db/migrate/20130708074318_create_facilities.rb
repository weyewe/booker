class CreateFacilities < ActiveRecord::Migration
  def change
    create_table :facilities do |t|
      t.string :name 
      t.text :description
      
      t.boolean :is_active, :default => true 

      t.timestamps
    end
  end
end
