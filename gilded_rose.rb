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

  def update_quality

    @items.each do |current_item|
      item = item_factory(current_item)
      item.update_item(current_item)
      # how to merge the item & current_item
    end
  end

  private

  def item_factory(current_item)
    case current_item.name
    when AGED_BRIE
      AgedBrie.new
    when BACKSTAGE_PASSES
      BackstagePass.new
    when SULFURAS
      Sulfuras.new
    else
      NormalItem.new
    end
  end
end
