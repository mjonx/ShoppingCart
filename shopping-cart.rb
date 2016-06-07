require 'date'

class ShoppingCart
  def initialize
    @items = []
  end
  def add_item(item)
    @items.push(item)
  end
  def checkout
    total = 0
    @items.each do |item|
      total += item.price
    end
    # if @items.length > 5
    #   total = total * 0.90
    # end
    return total
  end
end

class Item
  attr_reader :name, :price
  def initialize(name, price)
      @name = name
      @price = price
  end
  def price
      @price
  end
end

class Houseware < Item
  def price
    price = @price
      if price > 100
      	price = @price * 0.95
      else
      	price = @price
  	  end
  end
end

class Fruit < Item
  def price
    price = @price
    today = Date.today
  	if today > 5
      price = @price - @price * 0.9
    else
      price = @price
    end
    return price
  end
end



# Items
banana = Fruit.new("Banana", 10)
orange_juice = Item.new("Orange Juice", 10)
rice = Item.new("Rice", 1)
vacuum_cleaner = Houseware.new("Vacuum cleaner", 150)
anchovies = Item.new("Anchovies", 2)

# Shopping cart
my_cart = ShoppingCart.new
# add items
 my_cart.add_item(banana)
 my_cart.add_item(orange_juice)
 my_cart.add_item(rice)
 my_cart.add_item(vacuum_cleaner)
 my_cart.add_item(banana)
  my_cart.add_item(orange_juice)

# total price
my_cart.checkout

puts "Your total is #{my_cart.checkout}!"
