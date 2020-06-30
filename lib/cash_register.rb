class CashRegister
  
  attr_accessor :discount, :total, :purchases, :transactions
  
  def initialize(discount=nil)
    self.total = 0
    self.discount = discount if discount != nil
    self.purchases = []
  end
  
  def add_item(name, price, quantity=1)
    self.transactions = [name, price, quantity]
    quantity.times do 
      self.purchases.push self.transactions[0]
      self.total += self.transactions[1]
    end
  end
  
  def apply_discount
    if discount
      self.total = self.total - self.total*self.discount/100
      answer = "After the discount, the total comes to $#{self.total}."
    else
      answer = "There is no discount to apply."
    end
    answer
  end
  
  def items
    self.purchases
  end
  
  def void_last_transaction
    quantity = self.transactions[2]
    quantity.times do
      self.purchases.pop
      self.total -= self.transactions[1]
    end
  end
end





#   #void_last_transaction
#     subtracts the last item from the total (FAILED - 12)
#     returns the total to 0.0 if all items have been removed (FAILED - 13)






