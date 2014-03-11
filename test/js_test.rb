require 'minitest/autorun'
require 'jshintrb'

class JsTest < MiniTest::Test
  Dir.glob("_site/**/*.js").each do |file|
    define_method "test_#{file}" do
    
      results = Jshintrb.lint(File.read("test.js"))
      valid = false

      if results.length == 0
        valid = true
      end
      assert valid,true 
    end
  end
end