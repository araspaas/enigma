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
end 
