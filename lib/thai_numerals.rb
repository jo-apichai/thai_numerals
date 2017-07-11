require "thai_numerals/version"

module ThaiNumerals
  THAI_NUMBERS = {
    '0' => '๐',
    '1' => '๑',
    '2' => '๒',
    '3' => '๓',
    '4' => '๔',
    '5' => '๕',
    '6' => '๖',
    '7' => '๗',
    '8' => '๘',
    '9' => '๙'
  }.freeze

  def self.to_thai(number)
    number.to_s.gsub(Regexp.union(THAI_NUMBERS.keys), THAI_NUMBERS)
  end

  def self.to_arabic(number)
    arabic_numbers = THAI_NUMBERS.invert
    number.to_s.gsub(Regexp.union(arabic_numbers.keys), arabic_numbers)
  end
end
