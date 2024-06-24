# frozen_string_literal: true

class BackstagePass

  def update_item(item)
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
  end

  private

  def increase_quality(item, number = 1)
    number.times do
      item.quality += 1 if item.quality < 50
    end
  end

end
