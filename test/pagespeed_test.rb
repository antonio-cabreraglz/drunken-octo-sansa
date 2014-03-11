require 'minitest/autorun'
require_relative "pagespeed.rb"


class PagespeedTest < MiniTest::Unit::TestCase
  def test_homepage
    assert_operator Pagespeed.test('desktop', 'http://ruby-doc.org/'), :>=, 80
  end
end