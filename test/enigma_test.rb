require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_date
    encrypted_message = @enigma.encrypt("hello world", "02715")
    encrypted_message.stubs(:today).returns(Date.new(2020, 06, "08".to_i))
    assert_equal "060820", encrypted_message[:date]
    decrypted_message = @enigma.decrypt(encrypted_message[:encryption], "02715")
    assert_equal "060820", decrypted_message[:date]
  end

  def test_key
    encrypted_message = @enigma.encrypt("hello world")
    assert_instance_of String, encrypted_message[:key]
    assert_equal 5, encrypted_message[:key].length
  end

  def test_encrypt
    expected = { encryption: "keder ohulw", key: "02715", date: "040895"}
    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
    encrypted_message = @enigma.encrypt("hello world", "02715")
    encrypted_message.stubs(:today).returns(Date.new(2020, 06, "08".to_i))
    expected2 = {encryption: "lib sdmcvpu", key: "02715", date: "060820"}
    assert_equal expected2, encrypted_message
  end

  def test_decrypt
    expected = {decryption: "hello world", key: "02715", date: "040895"}
    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
    encrypted_message = @enigma.encrypt("hello world", "02715")
    decrypted_message = @enigma.decrypt(encrypted_message[:encryption], "02715")
    expected2 = {decryption: "hello world", key: "02715", date: "060820"}
    assert_equal expected2, decrypted_message
  end
end
