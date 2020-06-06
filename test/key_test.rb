require './test/test_helper'
require './lib/enigma'
require './lib/offset'
require './lib/key'

class KeyTest < Minitest::Test
  def setup
    @key = Key.new("02715")
  end

  def test_it_exists
    assert_instance_of Key, @key
  end
end
