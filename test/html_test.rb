require 'minitest/autorun'
require 'w3c_validators'

include W3CValidators


class HtmlTest < MiniTest::Test
  Dir.glob("_site/**/*.html").each do |file|
    define_method "test_#{file}" do
      
      @validator = MarkupValidator.new
      valid = false
      # turn on debugging messages
      @validator.set_debug!(true)
      
      results = @validator.validate_file(file)
      puts "Validating #{file}"

      if results.errors.length > 0
        results.errors.each do |err|
        puts err.to_s
      end
      else
        valid = true
     end

      assert_equal valid,true
    end
  end
end