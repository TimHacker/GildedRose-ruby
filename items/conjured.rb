# frozen_string_literal: true
require_relative './item.rb'

class Conjured < Item

  def update_item
    @quality -= 2 if @quality.positive?
    @sell_in -= 1
    @quality -= 2 if @sell_in.negative? && @quality.positive?
  end
end
