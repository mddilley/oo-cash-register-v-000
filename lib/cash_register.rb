require 'pry'

class CashRegister

  attr_accessor :total, :discount, :last_transaction

  def initialize(discount = nil)
    @total = 0
    @item = []
    @discount = discount
  end

  def add_item(item, price, quantity = nil)
    quantity == nil ? @last_transaction = price : @last_transaction = price * quantity
    quantity == nil ? @item << item : quantity.times {|i| @item << item}
    quantity == nil ? @total += price : @total += (price * quantity)
  end

  def has_quantity?
    quantity == nil ? nil : false
  end

  def apply_discount
    if @discount != nil
      @total = @total - (@total * (@discount / 100.0))
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @item
  end

  def void_last_transaction
    @total = @total - @last_transaction
  end

end
