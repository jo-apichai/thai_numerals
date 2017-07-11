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

  describe '#to_thai_counting' do
    it 'converts Arabic number to Thai counting' do
      expect(ThaiNumerals.to_thai_counting(0)).to eq 'ศูนย์'
      expect(ThaiNumerals.to_thai_counting(1)).to eq 'หนึ่ง'
      expect(ThaiNumerals.to_thai_counting(11)).to eq 'สิบเอ็ด'
      expect(ThaiNumerals.to_thai_counting(21)).to eq 'ยี่สิบเอ็ด'
      expect(ThaiNumerals.to_thai_counting(1_234_567)).to eq 'หนึ่งล้านสองแสนสามหมื่นสี่พันห้าร้อยหกสิบเจ็ด'
      expect(ThaiNumerals.to_thai_counting(20_202_020)).to eq 'ยี่สิบล้านสองแสนสองพันยี่สิบ'
      expect(ThaiNumerals.to_thai_counting(101_010_101)).to eq 'หนึ่งร้อยเอ็ดล้านหนึ่งหมื่นหนึ่งร้อยเอ็ด'
    end
  end
end
