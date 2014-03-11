require 'minitest/autorun'
require 'jshintrb'

class JsTest < MiniTest::Unit::TestCase
  Dir.glob("js/**/*.js").each do |file|
    define_method "test_#{file}" do
      puts "Validating : #{file}"
      results = Jshintrb.lint(File.read("#{file}"))
      valid = false

      if results.length == 0
        valid = true
      end
      assert valid,true 
    end
  end
end