require './test/test_helper'
require './lib/enigma'
require './lib/offset'

class OffsetTest < Minitest::Test
  def setup
    @offset = Offset.new("040895")
    @offset2 = Offset.new
  end

  def test_it_exists
    assert_instance_of Offset, @offset
    assert_instance_of Offset, @offset2
  end

  def test_it_has_a_date
    assert_equal "040895", @offset.date
    @offset2.stubs(:today).returns(Date.new(2020, 06, "08".to_i))
    assert_equal "060820", @offset2.date
  end

  def test_it_can_square_date
    assert_equal 1672401025, @offset.date_squared
    @offset2.stubs(:today).returns(Date.new(2020, 04, "08".to_i))
    assert_equal 3699072400, @offset2.date_squared
    offset = Offset.new

    offset.stubs(:date).returns("000001")
    assert_equal 1, offset.date_squared
  end

  def test_it_creates_offset
    expected = {A: 1, B: 0, C: 2, D:5}
    assert_equal expected, @offset.create_offset

    offset = Offset.new

    offset.stubs(:date_squared).returns(1)
    expected2 = {A: 0, B: 0, C: 0, D: 1}
    assert_equal expected2, offset.create_offset
  end
end
