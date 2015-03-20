require 'inventory_item.rb'

def update_item(item)
  item.update_sell_in
  item.update_quality
  item.update_quality_for_expired
end

def update_quality_for_expired(item)
  item.update_quality_for_expired
end

def update_quality(items)
  items.each do |item|
    inventory_item = InventoryItem.new(item)
    update_item(inventory_item)
  end
end

# DO NOT CHANGE THINGS BELOW -----------------------------------------

Item = Struct.new(:name, :sell_in, :quality)

# We use the setup in the spec rather than the following for testing.
#
# Items = [
#   Item.new("+5 Dexterity Vest", 10, 20),
#   Item.new("Aged Brie", 2, 0),
#   Item.new("Elixir of the Mongoose", 5, 7),
#   Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
#   Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
#   Item.new("Conjured Mana Cake", 3, 6),
# ]

