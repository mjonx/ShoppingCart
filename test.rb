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
    #special discount if items >5
    total-= ((total*10)/100) if @items.length >5
    total
  end
end
class Item 
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
    #5% discount if item price >100
    price = @price
    price -= ((price*5)/100) if price >100
    price
  end
end
class Fruit < Item
  def price
    #discount 10% if weekend
    price = @price
    date = Date.today
    price -= ((price*10)/100) if date.wday == 6 || date.wday == 7
    price
  end
end
shop = ShoppingCart.new
#items
banana = Fruit.new("Banana", 10)
vaccuum = Houseware.new("Vaccuum", 150)
oj = Item.new("Orange Juice", 10)
rice = Item.new("Rice", 1)
anchovies = Item.new("Anchovies", 2)
#addItems to shop
shop.add_item(banana)
shop.add_item(banana)
shop.add_item(vaccuum)
shop.add_item(vaccuum)
shop.add_item(rice)
shop.add_item(anchovies)
#total
puts shop.checkout