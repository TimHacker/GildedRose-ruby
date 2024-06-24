# frozen_string_literal: true

class AgedBrie
  def update_item(item)
    increase_quality(item)
    increase_quality(item) if item.sell_in <= 0
    item.sell_in -= 1
  end

  private

  def increase_quality(item, number = 1)
    number.times do
      item.quality += 1 if item.quality < 50
    end
  end
end
