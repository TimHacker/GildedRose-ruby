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
        increase_quality(item)
        increase_quality(item) if item.sell_in <= 0
        item.sell_in -= 1

      when BACKSTAGE_PASSES
        if item.sell_in <= 0
          item.quality = 0
        elsif item.sell_in < 6
          increase_quality(item, 3)
        elsif item.sell_in < 11
          increase_quality(item, 2)
        else
          increase_quality(item)
        end
        item.sell_in -= 1
        item.quality -= 1 if item.sell_in.negative? && item.quality.positive?
      when SULFURAS
        # do nothing as sulfuras is a special item
      else
        item.quality -= 1 if item.quality.positive?
        item.sell_in -= 1
        item.quality -= 1 if item.sell_in.negative? && item.quality.positive?
      end
    end
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
