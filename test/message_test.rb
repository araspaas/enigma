require './test/test_helper'
require './lib/message'
require './lib/key'
require './lib/offset'

class MessageTest < Minitest::Test
  def setup
    @message = Message.new("hello world", "02715", "040895")
    @decode_message = Message.new("keder ohulw", "02715", "040895")
  end

  def test_it_exists
    assert_instance_of Message, @message
    assert_instance_of Message, @decode_message
  end

  def test_it_has_attributes
    assert_equal "hello world", @message.message
    assert_equal "02715", @message.key
    assert_equal "040895", @message.date
    assert_equal "keder ohulw", @decode_message.message
    assert_equal "02715", @decode_message.key
    assert_equal "040895", @decode_message.date
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
    assert_equal expected, @decode_message.keys
  end

  def test_offsets
    expected = {A: 1, B: 0, C:2, D: 5}
    assert_equal expected, @message.offsets
    assert_equal expected, @decode_message.offsets
  end

  def test_initial_shifts
    expected = {A: 3, B: 27, C: 73, D:20}
    assert_equal expected, @message.initial_shift
    assert_equal expected, @decode_message.initial_shift
  end

  def test_it_can_shift
    expected = {A: 3, B: 0, C: 19, D: 20}
    assert_equal expected, @message.shifts
    assert_equal expected, @decode_message.shifts
  end

  def test_split_message
    expected = ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]
    assert_equal expected, @message.split_message
  end

  def test_it_can_encrypt
    assert_equal "keder ohulw", @message.encrypt_message
  end

  def test_it_can_decrypt
    assert_equal "hello world", @decode_message.decrypt_message
  end

  def test_encrypt
    expected = {encryption: "keder ohulw", key: "02715", date: "040895"}
    assert_equal expected, @message.encrypt
  end

  def test_decrypt
    expected = {decryption: "hello world", key: "02715", date: "040895"}
    assert_equal expected, @decode_message.decrypt
  end
end
