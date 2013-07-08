class Facility < ActiveRecord::Base
  validates_uniqueness_of :name 
  validates_presence_of :name 
  
  
  def self.create_object(params)
    new_object             = self.new 
    new_object.name        = params[:name]
    new_object.description = params[:description]
    new_object.save 
  end
  
  def update_object(params)
    self.name = params[:name]
    self.description = params[:description]
    self.save 
  end
  
  def delete_object( params ) 
    if self.bookings.count != 0 
      self.errors.add(:generic_errors, 'Sudah ada booking atas fasilitas ini')
      return self 
    end
    
    self.destroy 
  end
  
=begin
  Utility methods 
=end
end
