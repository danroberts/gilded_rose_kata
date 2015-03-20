class InventoryItem
  def initialize(struct) 
    @struct = struct
  end

  def is_legendary
    name == 'Sulfuras, Hand of Ragnaros'
  end

  def appreciating_item
    name == 'Aged Brie' || name == 'Backstage passes to a TAFKAL80ETC concert'
  end

  def name
    @struct.name
  end

  def sell_in
    @struct.sell_in
  end

  def quality 
    @struct.quality
  end

  def name=(name)
    @struct.name = name
  end

  def sell_in=(sell_in)
    @struct.sell_in = sell_in
  end

  def quality=(quality)
    @struct.quality = quality
  end
end

