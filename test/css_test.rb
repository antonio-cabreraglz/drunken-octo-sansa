require 'minitest/autorun'
require 'w3c_validators'

include W3CValidators


class CssTest < MiniTest::Unit::TestCase
  Dir.glob("css/**/*.css").each do |file|
    define_method "test_#{file}" do
      puts file
      @validator_css = CSSValidator.new
      valid = false
      results = @validator_css.validate_file(file)
      if results.errors.length > 0
        results.errors.each do |err|
        puts err.to_s
      end
      else
        puts 'Valid!'
        valid = true
      end

      puts 'Debugging messages'
      results.debug_messages.each do |key, value|
        puts "#{key}: #{value}"
      end
      assert_equal true,true
    end
  end
end