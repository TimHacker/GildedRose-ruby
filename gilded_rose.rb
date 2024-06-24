require_relative 'items/backstage_pass'
require_relative 'items/aged_brie'

class GildedRose

  def initialize(items)
    @items = items
  end

  AGED_BRIE = 'Aged Brie'
  BACKSTAGE_PASSES = 'Backstage passes to a TAFKAL80ETC concert'
  SULFURAS = 'Sulfuras, Hand of Ragnaros'

  def increase_quality(item, number = 1)
    number.times do
      item.quality += 1 if item.quality < 50
    end
  end

  def update_quality()
    @items.each do |item|
      case item.name
      when AGED_BRIE
        AgedBrie.new.update_item(item)
      when BACKSTAGE_PASSES
        BackstagePass.new.update_item(item)
      when SULFURAS
        sulfuras(item)
      else
        normal_item(item)
      end
    end
  end

  private
  def sulfuras(item)
    # do nothing as sulfuras is a special item
  end

  def normal_item(item)
    item.quality -= 1 if item.quality.positive?
    item.sell_in -= 1
    item.quality -= 1 if item.sell_in.negative? && item.quality.positive?
  end

end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
