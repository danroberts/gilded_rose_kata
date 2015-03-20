require 'gilded_rose.rb'

describe "The gilded rose" do

  let (:vest) { Item.new("+5 Dexterity Vest", 10, 20) }
  let (:brie) { Item.new("Aged Brie", 2, 0) }
  let (:elixer) { Item.new("Elixir of the Mongoose", 5, 7) }
  let (:sulfuras) { Item.new("Sulfuras, Hand of Ragnaros", 0, 80) }
  let (:backstage_pass) { Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20) }
  let (:mana_cake) { Item.new("Conjured Mana Cake", 3, 6) }

  let (:list) { [vest, brie, elixer, sulfuras, backstage_pass, mana_cake] }

  describe "Every day" do
    it "decrements the sell by date" do
      update_quality(list)
      expect(vest.sell_in).to eq 9
    end

    it "decrements the quality" do
      update_quality(list)
      expect(vest.quality).to eq 19
    end
  end

  describe "When the sell by is 0" do
    it 'quality degrades twice as fast' do
      vest.sell_in = 0
      update_quality(list)
      expect(vest.quality).to eq 18
    end
  end

  describe "The quality of an item" do
    it "is never negative" do
      vest.quality = 0
      update_quality(list)
      expect(vest.quality).to eq 0
    end

    it "is never more than 50" do
      brie.quality = 50
      update_quality(list)
      expect(brie.quality).to eq 50
    end
  end
    
  describe "Aged Brie" do
    it "increases in quality the older it gest" do
      update_quality(list)
      expect(brie.quality).to eq 1
    end
  end

  describe "Sulfuras" do
    it "has no sell_in" do
      update_quality(list)
      expect(sulfuras.sell_in).to eq 0
    end
    
    it "does not decrease in quality" do
      update_quality(list)
      expect(sulfuras.quality).to eq 80
    end
  end

  describe "Backstage Passes" do
    it 'increases quality by 2 when there are 10 days or less to sell_in' do
      backstage_pass.sell_in = 10
      update_quality(list)
      expect(backstage_pass.quality).to eq 22
    end

    it 'increases quality by 3 when there are 5 days or less to sell_in' do
      backstage_pass.sell_in = 5
      update_quality(list)
      expect(backstage_pass.quality).to eq 23
    end

    it 'has quality 0 after the concert passes' do
      backstage_pass.sell_in = 0
      update_quality(list)
      expect(backstage_pass.quality).to eq 0
    end
  end
end
