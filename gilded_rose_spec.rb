# frozen_string_literal: true

require File.join(File.dirname(__FILE__), 'gilded_rose')

def update_item(name, sell_in, quality, occurrences = 1)
  items = [Item.new(name, sell_in, quality)]
  occurrences.times do
    GildedRose.new(items).update_quality
  end
  items
end

describe GildedRose do
  describe '#update_quality' do
    it 'does not change the name' do
      items = update_item('foo', 0, 0)
      expect(items[0].name).to eq 'foo'
    end

    it 'decreases sell-in and quality by 1 for normal item' do
      items = update_item('bar', 1, 1)
      expect(items[0].sell_in).to eq 0
      expect(items[0].quality).to eq 0
    end

    it 'decreases quality twice as fast once the item is past its sell-in date' do
      items = update_item('soap', -1, 2)
      expect(items[0].sell_in).to eq(-2)
      expect(items[0].quality).to eq 0
    end

    it 'quality of an item is never negative' do
      items = update_item('soap', 3, 0, 2)
      expect(items[0].sell_in).to eq 1
      expect(items[0].quality).to eq 0
    end

    it 'aged brie increases in quality with time' do
      items = update_item('Aged Brie', 3, 49)
      expect(items[0].sell_in).to eq 2
      expect(items[0].quality).to eq 50
    end

    it 'the quality of an item can never be over 50' do
      items = update_item('Aged Brie', 3, 50)
      expect(items[0].sell_in).to eq 2
      expect(items[0].quality).to eq 50
    end

  end
end
