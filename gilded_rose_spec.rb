# frozen_string_literal: true

require File.join(File.dirname(__FILE__), 'gilded_rose')

def update_item(name, sell_in, quality, occurrences = 1)
  items = [Item.new(name, sell_in, quality)]
  occurrences.times do
    GildedRose.new(items).update_quality
  end
  items
end

def expect_item_sell_in_and_quality_to_be(item, sell_in, quality)
  expect(item.sell_in).to eq sell_in
  expect(item.quality).to eq quality
end

describe GildedRose do
  describe '#update_quality' do
    it 'does not change the name' do
      items = update_item('foo', 0, 0)
      expect(items[0].name).to eq 'foo'
    end

    it 'decreases sell-in and quality by 1 for normal item' do
      items = update_item('bar', 1, 1)
      expect_item_sell_in_and_quality_to_be(items[0], 0, 0)
    end

    it 'decreases quality twice as fast once the item is past its sell-in date' do
      items = update_item('soap', -1, 2)
      expect_item_sell_in_and_quality_to_be(items[0], -2, 0)
    end

    it 'quality of an item is never negative' do
      items = update_item('soap', 3, 0, 2)
      expect_item_sell_in_and_quality_to_be(items[0], 1, 0)
    end

    it 'aged brie increases in quality with time' do
      items = update_item(GildedRose::AGED_BRIE, 3, 49)
      expect_item_sell_in_and_quality_to_be(items[0], 2, 50)
    end

    it 'aged brie increases in quality by two when sell in has passed' do
      items = update_item(GildedRose::AGED_BRIE, 0, 40)
      expect_item_sell_in_and_quality_to_be(items[0], -1, 42)
    end

    it 'the quality of Aged Brie can never be over 50' do
      items = update_item(GildedRose::AGED_BRIE, 3, 50)
      expect_item_sell_in_and_quality_to_be(items[0], 2, 50)
    end

    it 'the quality and sell in of Sulfuras never changes when sell-in is zero' do
      items = update_item(GildedRose::SULFURAS, 0, 80)
      expect_item_sell_in_and_quality_to_be(items[0], 0, 80)
    end

    it 'the quality and sell in of Sulfuras never changes for negative sell-in' do
      items = update_item(GildedRose::SULFURAS, -1, 80)
      expect_item_sell_in_and_quality_to_be(items[0], -1, 80)
    end

    it 'the quality of backstage passes increases by one if eleven or more days to concert' do
      items = update_item(GildedRose::BACKSTAGE_PASSES, 11, 25)
      expect_item_sell_in_and_quality_to_be(items[0], 10, 26)
    end

    it 'the quality of backstage passes increases by two if six to ten days left' do
      items = update_item(GildedRose::BACKSTAGE_PASSES, 10, 25)
      expect_item_sell_in_and_quality_to_be(items[0], 9, 27)
    end

    it 'the quality of backstage passes increases by two if six to ten days left' do
      items = update_item(GildedRose::BACKSTAGE_PASSES, 6, 25)
      expect_item_sell_in_and_quality_to_be(items[0], 5, 27)
    end

    it 'the quality of backstage passes increases by three if five or less days left' do
      items = update_item(GildedRose::BACKSTAGE_PASSES, 5, 25)
      expect_item_sell_in_and_quality_to_be(items[0], 4, 28)
    end

    it 'the quality of backstage passes increases by three if a day left' do
      items = update_item(GildedRose::BACKSTAGE_PASSES, 1, 25)
      expect_item_sell_in_and_quality_to_be(items[0], 0, 28)
    end

    it 'the quality of backstage passes drops to zero after the concert' do
      items = update_item(GildedRose::BACKSTAGE_PASSES, 0, 10)
      expect_item_sell_in_and_quality_to_be(items[0], -1, 0)
    end

    it 'the quality of backstage passes can never be over 50' do
      items = update_item(GildedRose::BACKSTAGE_PASSES, 1, 48)
      expect_item_sell_in_and_quality_to_be(items[0], 0, 50)
    end
  end
end
