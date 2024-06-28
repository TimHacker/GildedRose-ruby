require_relative 'items/backstage_pass'
require_relative 'items/aged_brie'
require_relative 'items/normal_item'
require_relative 'items/sulfuras'
require_relative 'items/item'

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
        Sulfuras.new.update_item
      else
        NormalItem.new.update_item(item)
      end
    end
  end
end

