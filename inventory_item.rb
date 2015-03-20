class InventoryItem
  def initialize(item) 
    @item = item
  end

  def update_quality
    decrease_quality
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
      @item.quality -= 1
    end
  end

  def update_quality_for_expired
    return if !expired
    decrease_quality
  end

  def update_sell_in
    @item.sell_in -= 1
  end
end

class AppreciatingInventoryItem < InventoryItem
  def update_quality
    increase_quality
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

class ConcertTicketInventoryItem < ExpiringInventoryItem
  def update_quality
    increase_quality 

    if @item.sell_in < 11
      increase_quality
    end

    if @item.sell_in < 6
      increase_quality
    end
  end
end

class LegendaryInventoryItem < InventoryItem
  def update_sell_in
  end

  def decrease_quality
  end
end

