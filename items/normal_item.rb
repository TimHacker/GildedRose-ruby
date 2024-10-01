# frozen_string_literal: true
require_relative './item.rb'

class NormalItem < Item
  def update_item
    @quality -= 1 if @quality.positive?
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
