def increases_quality_with_time(item)
  item.name == 'Aged Brie' || item.name == 'Backstage passes to a TAFKAL80ETC concert'
end

def is_legendary(item)
  item.name == 'Sulfuras, Hand of Ragnaros'
end

def update_sell_in(item)
  if !is_legendary
    item.sell_in -= 1
  end
end

def decrease_quality(item)
  if item.quality > 0
    if !is_legendary
      item.quality -= 1
    end
  end
end

def increase_quality(item)
  if item.quality < 50
    item.quality += 1
    if item.name == 'Backstage passes to a TAFKAL80ETC concert'
      if item.sell_in < 11
        if item.quality < 50
          item.quality += 1
        end
      end
      if item.sell_in < 6
        if item.quality < 50
          item.quality += 1
        end
      end
    end
  end
end

def update_item(item)
  if !increases_quality_with_time(item)
    decrease_quality(item)
  else
    increase_quality(item)
  end

  update_sell_in(item)

  if item.sell_in < 0
    if item.name != "Aged Brie"
      if item.name != 'Backstage passes to a TAFKAL80ETC concert'
        decrease_quality(item)
      else
        item.quality = item.quality - item.quality
      end
    else
      if item.quality < 50
        item.quality += 1
      end
    end
  end
end
def update_quality(items)
  items.each do |item|
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

