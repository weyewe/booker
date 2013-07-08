class Booking < ActiveRecord::Base
  # attr_accessible :title, :body
  
  def self.create_object( params ) 
  end
  
  def update_object( params ) 
  end
  
  def delete_object( params ) 
    if not self.is_confirmed?
      self.destroy
      return 
    end
    
    self.errors.add(:generic_errors, "This booking has been confirmed. Ask admin.")
    return self 
  end
  
  
  def confirm(params)
    if self.is_confirmed?
      self.errors.add(:is_confirmed, "Sudah dikonfirmasi")
      return self 
    end
    
    self.downpayment_amount = BigDecimal( params[:downpayment_amount])
    self.is_confirmed = true 
    self.confirmed_at = DateTime.now 
    self.save 
  end
  
  def pay_and_close(params)
    if self.is_paid?
      self.errors.add(:is_paid, "Sudah dibayar")
      return self 
    end
    
    self.actual_starting_at = params[:actual_starting_at]
    self.actual_ending_at = params[:actual_ending_at]
    
    self.paid_at  = DateTime.now 
    self.is_paid = true 
    self.payment_amount = BigDecimal( params[:payment_amount] ) 
    self.save 
    
    # generate transaction activity 
  end
  
  
  
  
  
  
  
end
