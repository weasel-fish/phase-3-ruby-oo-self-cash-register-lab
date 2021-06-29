require "pry"

class CashRegister
    attr_reader :discount
    attr_accessor :total, :items

    def initialize(emp_discount = 0)
        @total = 0
        @discount = emp_discount
        @items = []
    end

    def add_item(item, price, quantity = 1)
        @last_item = item
        @last_price = price
        @last_quantity = quantity
        
        count = 0
        while count < quantity do
            self.items << item
            self.total += price
            count += 1
        end
    end

    def apply_discount
        if self.discount == 0
            "There is no discount to apply."
        else
            self.total = @total - @total * (@discount / 100.0)
            "After the discount, the total comes to $#{self.total.to_i}."
        end
    end

    def void_last_transaction
        count = 0
        while count < @last_quantity do
            self.items.pop
            self.total -= @last_price
            count += 1
        end
    end

end


#cash_register_with_discount = CashRegister.new(20)
#cash_register_with_discount.add_item("macbook air", 1000)