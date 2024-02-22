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
      if (item.name == AGED_BRIE)
        increase_quality(item)
        if item.sell_in <= 0
          increase_quality(item)
        end

      elsif (item.name == BACKSTAGE_PASSES)

        if item.sell_in <= 0
          item.quality = 0
        elsif item.sell_in < 6
          increase_quality(item, 3)
        elsif item.sell_in < 11
          increase_quality(item, 2)
        else
          increase_quality(item)
        end

      else
        if item.quality.positive?
          if item.name != SULFURAS
            item.quality -= 1
          end
        end
      end
      if item.name != SULFURAS
        item.sell_in -= 1
      end
      if item.sell_in.negative? && item.quality.positive?
        item.quality -= 1 unless item.name == SULFURAS || item.name == AGED_BRIE
      end
      # We want to group all the logic for a single item together
      # it should not be scattered around the file but in one place for each item
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
