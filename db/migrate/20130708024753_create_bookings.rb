class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :resource_id
      t.integer :customer_id 
      
      t.datetime :booking_starting_at
      t.datetime :booking_ending_at 
      
      
      # upon confirmation, downpayment 
      # must be paid
      # => before confirmation, it is fine to update the data 
      t.decimal :downpayment_amount , :precision => 11, :scale => 2 , :default => 0  
      t.boolean :is_confirmed, :default => false  
      t.datetime :confirmed_at 
      
      
      
      # the calculation is up to the employee. Including the scheme and all the things. 
      
      # after confirmation, has to be updated by admin , not by data entry 
      
      
      
      # on the execution  
      t.datetime :actual_starting_at
      t.datetime :actual_ending_at
      
      
      t.boolean :is_paid, :default => false 
      t.datetime :paid_at  
      
      
      t.decimal :payment_amount , :precision => 11, :scale => 2 , :default => 0
      
      

      t.timestamps
    end
  end
end
