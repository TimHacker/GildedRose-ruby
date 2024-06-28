# frozen_string_literal: true

class NormalItem
  def update_item(item)
    item.quality -= 1 if item.quality.positive?
    item.sell_in -= 1
    item.quality -= 1 if item.sell_in.negative? && item.quality.positive?
  end

  private

  def increase_quality(item, number = 1)
    number.times do
      item.quality += 1 if item.quality < 50
    end
  end
end
