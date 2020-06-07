require './test/test_helper'
require './lib/message'
require './lib/key'
require './lib/offset'

class MessageTest < Minitest::Test
  def setup
    @message = Message.new("hello world", "02715", "040895")
  end

  def test_it_exists
    assert_instance_of Message, @message
  end

  def test_it_has_attributes
    assert_equal "hello world", @message.message
    assert_equal "02715", @message.key
    assert_equal "040895", @message.date
  end

  def test_it_has_the_alphabet
    expected = ["a", "b", "c", "d", "e", "f",
        "g", "h", "i", "j", "k", "l",
        "m", "n", "o", "p", "q", "r",
        "s", "t", "u", "v", "w", "x",
        "y", "z", " "]
    assert_equal expected, @message.alphabet
  end

  def test_keys
    expected = { A: 2, B: 27, C: 71, D: 15}
    assert_equal expected, @message.keys
  end

  def test_offsets
    expected = {A: 1, B: 0, C:2, D: 5}
    assert_equal expected, @message.offsets
  end

  def test_it_can_shift
    expected = {A: 3, B: 27, C: 73, D: 20}
    assert_equal expected, @message.shifts
  end
end
