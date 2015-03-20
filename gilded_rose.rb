require 'inventory_item.rb'

def update_item(item)
  if !appreciating_item(item)
    decrease_quality(item)
  else
    increase_daily_quality(item)
  end

  update_sell_in(item)

  if expired(item)
    update_quality_for_expired(item)
  end
end

def update_quality_for_expired(item)
  if !appreciating_item(item)
    decrease_quality(item)
  end

  if item.name == "Aged Brie"
    increase_quality(item)
  end

  if item.name == 'Backstage passes to a TAFKAL80ETC concert'
    item.quality = item.quality - item.quality
  end
end

def expired(item)
 item.sell_in < 0 
end

def appreciating_item(item)
  item.name == 'Aged Brie' || item.name == 'Backstage passes to a TAFKAL80ETC concert'
end

def is_legendary(item)
  item.name == 'Sulfuras, Hand of Ragnaros'
end

def update_sell_in(item)
  if !is_legendary(item)
    item.sell_in -= 1
  end
end

def decrease_quality(item)
  if item.quality > 0
    if !is_legendary(item)
      item.quality -= 1
    end
  end
end

def increase_daily_quality(item)
  increase_quality(item)

  if item.name == 'Backstage passes to a TAFKAL80ETC concert'
    if item.sell_in < 11
      increase_quality(item)
    end
    if item.sell_in < 6
      increase_quality(item)
    end
  end
end

def increase_quality(item)
  if item.quality < 50
    item.quality += 1
  end
end


def update_quality(items)
  items.each do |item|
    item = InventoryItem.new(item)
    update_item(item)
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

