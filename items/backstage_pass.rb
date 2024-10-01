# frozen_string_literal: true
require_relative './item.rb'

class BackstagePass < Item

  def update_item
    if @sell_in <= 0
      @quality = 0
    elsif @sell_in < 6
      increase_quality(3)
    elsif @sell_in < 11
      increase_quality(2)
    else
      increase_quality
    end
    @sell_in -= 1
    @quality -= 1 if @sell_in.negative? && @quality.positive?
  end

  private

  def increase_quality(number = 1)
    number.times do
      @quality += 1 if @quality < 50
    end
  end

end
