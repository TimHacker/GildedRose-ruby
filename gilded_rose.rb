require_relative 'items/backstage_pass'
require_relative 'items/aged_brie'
require_relative 'items/normal_item'
require_relative 'items/sulfuras'
require_relative 'items/item'

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
      item.update_item(current_item)
      # how to merge the item & current_item
    end
  end

end
