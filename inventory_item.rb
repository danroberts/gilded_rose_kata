class InventoryItem
  def initialize(item) 
    @item = item
  end

  def update_quality
    decrease_quality
  end

  def is_legendary
    @item.name == 'Sulfuras, Hand of Ragnaros'
  end

  def expired
    @item.sell_in < 0 
  end

  def increase_quality
    if @item.quality < 50
      @item.quality += 1
    end
  end

  def decrease_quality
    if @item.quality > 0
      if !is_legendary
        @item.quality -= 1
      end
    end
  end
  
  def increase_daily_quality
    increase_quality

    if @item.name == 'Backstage passes to a TAFKAL80ETC concert'
      if @item.sell_in < 11
        increase_quality
      end
      if @item.sell_in < 6
        increase_quality
      end
    end
  end

  def update_quality_for_expired
    return if !expired
    decrease_quality
  end

  def update_sell_in
    if !is_legendary
      @item.sell_in -= 1
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

class AppreciatingInventoryItem < InventoryItem
  def update_quality
    increase_daily_quality
  end

  def update_quality_for_expired
    return if !expired
    increase_quality
  end
end

class ExpiringInventoryItem < AppreciatingInventoryItem
  def update_quality_for_expired
    return if !expired
    @item.quality = 0
  end
end
