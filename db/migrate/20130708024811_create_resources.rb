class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      
      t.string :name 
      t.text :description
      
      t.boolean :is_active, :default => true 

      t.timestamps
    end
  end
end
