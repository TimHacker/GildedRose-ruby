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

        if item.sell_in < 6
          increase_quality(item, 3)
        elsif item.sell_in < 11
          increase_quality(item, 2)
        else
          increase_quality(item)
        end

          # item.sell_in -= 1

          # if item.sell_in.negative?
          #   item.quality = 0
          # end
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
      if item.name == AGED_BRIE && item.sell_in.negative?
        # increase_quality(item)
      elsif item.name == BACKSTAGE_PASSES && item.sell_in.negative?
        item.quality = 0
      elsif item.sell_in.negative? && item.quality.positive?
        item.quality -= 1 unless item.name == SULFURAS || item.name == AGED_BRIE
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
