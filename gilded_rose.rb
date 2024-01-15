class GildedRose

  def initialize(items)
    @items = items
  end

  def increase_by_one(item, number = 1)
    item.quality += number if item.quality < 50
  end

  def update_quality()
    @items.each do |item|
      if (item.name == 'Aged Brie')
        increase_by_one(item)
      elsif (item.name == 'Backstage passes to a TAFKAL80ETC concert')
          if item.sell_in < 6
            increase_by_one(item, 3)
          elsif item.sell_in < 11
            increase_by_one(item, 2)
          else
            increase_by_one(item)
          end
      else
        if item.quality.positive?
          if item.name != 'Sulfuras, Hand of Ragnaros'
            item.quality -= 1
          end
        end
      end
      if item.name != 'Sulfuras, Hand of Ragnaros'
        item.sell_in -= 1
      end
      if item.sell_in.negative?
        if item.name == 'Aged Brie'
          increase_by_one(item)
        elsif item.name == 'Backstage passes to a TAFKAL80ETC concert'
          item.quality = 0
        elsif item.quality.positive?
          item.quality -= 1 unless item.name == 'Sulfuras, Hand of Ragnaros'
        end
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
