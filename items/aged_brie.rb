# frozen_string_literal: true
require_relative './item.rb'
class AgedBrie < Item
  def update_item
    increase_quality
    increase_quality if @sell_in <= 0
    @sell_in -= 1
  end

  private

  def increase_quality(number = 1)
    number.times do
      @quality += 1 if @quality < 50
    end
  end
end
