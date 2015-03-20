class InventoryItem
  def initialize(item) 
    @item = item
  end

  def is_legendary
    @item.name == 'Sulfuras, Hand of Ragnaros'
  end

  def appreciating_item
    @item.name == 'Aged Brie' || @item.name == 'Backstage passes to a TAFKAL80ETC concert'
  end

  def expired
    @item.sell_in < 0 
  end

  def increase_quality
    if @item.quality < 50
      @item.quality += 1
    end
  end

  def name
    @item.name
  end

  def sell_in
    @item.sell_in
  end

  def quality 
    @item.quality
  end

  def name=(name)
    @item.name = name
  end

  def sell_in=(sell_in)
    @item.sell_in = sell_in
  end

  def quality=(q)
    @item.quality = q
  end
end

