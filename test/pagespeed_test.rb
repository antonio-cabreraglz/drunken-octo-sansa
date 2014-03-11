require 'minitest/autorun'
require_relative "pagespeed.rb"


class PagespeedTest < MiniTest::Test
  def test_homepage
    assert_operator Pagespeed.test('desktop', 'http://ruby-doc.org/'), :>=, 80
  end
end