class Item
  attr_accessor :name, :sell_in, :quality
  # we want to remove attr_accessor

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  AGED_BRIE = 'Aged Brie'
  BACKSTAGE_PASSES = 'Backstage passes to a TAFKAL80ETC concert'
  SULFURAS = 'Sulfuras, Hand of Ragnaros'
  CONJURED = 'Conjured item'

  def self.item_factory(current_item)
    case current_item.name
    when AGED_BRIE
      AgedBrie.new(current_item.name, current_item.sell_in, current_item.quality)
    when BACKSTAGE_PASSES
      BackstagePass.new(current_item.name, current_item.sell_in, current_item.quality)
    when SULFURAS
      Sulfuras.new(current_item.name, current_item.sell_in, current_item.quality)
    when CONJURED
      Conjured.new(current_item.name, current_item.sell_in, current_item.quality)
    else
      NormalItem.new(current_item.name, current_item.sell_in, current_item.quality)
    end
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end