require "spec_helper"

RSpec.describe ThaiNumerals do
  it "has a version number" do
    expect(ThaiNumerals::VERSION).not_to be nil
  end

  describe '#to_thai' do
    it 'converts Arabic number to Thai number' do
      expect(ThaiNumerals.to_thai(1234567890)).to eq '๑๒๓๔๕๖๗๘๙๐'
      expect(ThaiNumerals.to_thai('1234567890')).to eq '๑๒๓๔๕๖๗๘๙๐'
      expect(ThaiNumerals.to_thai('1,234,567,890')).to eq '๑,๒๓๔,๕๖๗,๘๙๐'
      expect(ThaiNumerals.to_thai('12,345,678.90')).to eq '๑๒,๓๔๕,๖๗๘.๙๐'
    end
  end

  describe '#to_arabic' do
    it 'converts Thai number to Arabic number' do
      expect(ThaiNumerals.to_arabic('๑๒๓๔๕๖๗๘๙๐')).to eq '1234567890'
      expect(ThaiNumerals.to_arabic('๑,๒๓๔,๕๖๗,๘๙๐')).to eq '1,234,567,890'
      expect(ThaiNumerals.to_arabic('๑๒,๓๔๕,๖๗๘.๙๐')).to eq '12,345,678.90'
    end
  end
end
