require './test/test_helper'
require './lib/decode_message'

class DecodeMessageTest < Minitest::Test
  def setup
    @decode_message = DecodeMessage.new("keder ohulw", "02715", "040895")
  end

  def test_it_exists
    assert_instance_of DecodeMessage, @decode_message
  end

  def test_it_has_attributes
    assert_equal "keder ohulw", @decode_message.message
    assert_equal "02715", @decode_message.key
    assert_equal "040895", @decode_message.date
  end

  def test_it_has_the_alphabet
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @decode_message.alphabet
  end
end
