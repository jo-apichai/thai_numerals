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

  THAI_COUNTINGS = {
    '0' => 'ศูนย์',
    '1' => 'หนึ่ง',
    '2' => 'สอง',
    '3' => 'สาม',
    '4' => 'สี่',
    '5' => 'ห้า',
    '6' => 'หก',
    '7' => 'เจ็ด',
    '8' => 'แปด',
    '9' => 'เก้า'
  }.freeze

  THAI_SUFFIXS = {
    0 => '',
    1 => 'สิบ',
    2 => 'ร้อย',
    3 => 'พัน',
    4 => 'หมื่น',
    5 => 'แสน',
    6 => 'ล้าน'
  }

  def self.to_thai(number)
    number.to_s.gsub(Regexp.union(THAI_NUMBERS.keys), THAI_NUMBERS)
  end

  def self.to_arabic(number)
    arabic_numbers = THAI_NUMBERS.invert
    number.to_s.gsub(Regexp.union(arabic_numbers.keys), arabic_numbers)
  end

  def self.to_thai_counting(number)
    return THAI_COUNTINGS['0'] if number.zero?

    number.to_s.reverse.scan(/.{1,6}/).inject([]) do |arr, part|
      arr << thai_counting_partial(part)
    end.reverse.join(THAI_SUFFIXS[6])
  end

  private

    def self.thai_counting_partial(number)
      parts = []

      number.split('').each_with_index do |digit, index|
        next if digit.to_i.zero?

        if index == 0 && digit == '1' && number.length > 1
          word = 'เอ็ด'
        elsif index == 1 && digit.to_i < 3
          word = (digit == '1' ? '' : 'ยี่')
        else
          word = THAI_COUNTINGS[digit]
        end

        parts << "#{word}#{THAI_SUFFIXS[index]}"
      end

      parts.reverse.join('')
    end
end
