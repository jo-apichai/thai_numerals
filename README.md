# thai_numerals
A simple Thai numerals converter.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'thai_numerals'
```

And then execute:

    $ bundle

## Usage

#### Converting to a Thai number

```ruby
ThaiNumerals.to_thai(12345)       # => "๑๒๓๔๕"
```

#### Converting to an Arabic number

```ruby
ThaiNumerals.to_arabic("๑๒๓๔๕")   # => 12345
```

#### Converting to Thai counting

```ruby
ThaiNumerals.to_thai_counting(12345)  # => "หนึ่งหมื่นสองพันสามร้อยสี่สิบห้า"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/jo-apichai/thai_numerals/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
