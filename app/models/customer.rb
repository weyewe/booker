class Customer < ActiveRecord::Base
  # attr_accessible :title, :body
  validates_presence_of :phone_number, :name 
  

  def self.create_object(params)
    new_object = self.new 
    new_object.name = params[:name]
    new_object.phone_number = params[:phone_number]
    new_object.save 
    
    return new_object 
  end
  
  def update_object( params ) 
    self.name = params[:name]
    self.phone_number = params[:phone_number]
    self.save 
  end
  
  def delete_object( params ) 
    if self.bookings.count != 0 
      self.errors.add(:generic_errors, "Sudah ada booking")
      return self
    end
    
    self.destroy 
  end
  
  
end
