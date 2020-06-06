require './test/test_helper'
require './lib/enigma'
require './lib/offset'

class OffsetTest < Minitest::Test
  def setup
    @offset = Offset.new("040895")
  end

  def test_it_exists
      assert_instance_of Offset, @offset
  end

  def test_it_has_a_date
    assert_equal "040895", @offset.date
  end

  def test_it_can_square_date
    assert_equal 1672401025, @offset.date_squared
  end
end
