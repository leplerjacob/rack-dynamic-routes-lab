class Item
  attr_accessor :name, :price

  @@item = []

  def initialize(name,price)
    @@item << self
    @name = name
    @price = price
  end

  def self.all
    @@item
  end
end
