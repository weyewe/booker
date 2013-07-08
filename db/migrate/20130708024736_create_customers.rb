class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name 
      t.string :phone_number  #unique shite in this app 
      
      t.timestamps
    end
  end
end
