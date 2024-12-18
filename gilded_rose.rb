require_relative 'items/backstage_pass'
require_relative 'items/aged_brie'
require_relative 'items/normal_item'
require_relative 'items/sulfuras'
require_relative 'items/item'
require_relative 'items/conjured'

class GildedRose

  def initialize(items)
    @items = items
  end

  def increase_quality(item, number = 1)
    number.times do
      item.quality += 1 if item.quality < 50
    end
  end

  def update_quality

    @items.each do |current_item|
      item = Item.item_factory(current_item)
      item.update_item
      current_item.name = item.name
      current_item.quality = item.quality
      current_item.sell_in = item.sell_in
      # Yas to update by adding conjured item by next time remember (this line by TDD) - DONE!
      # rename to update by itself
      # how to merge the item & current_item
      # aged brie updater suggestion - we're copying item into new aged brie and then we have to copy back! no good
    end
  end

end
