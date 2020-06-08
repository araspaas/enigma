require './test/test_helper'
require './lib/decode_message'

class DecodeMessageTest < Minitest::Test
  def setup
    @decode_message = DecodeMessage.new("keder ohulw", "02715", "040895")
  end

  def test_it_exists
    assert_instance_of DecodeMessage, @decode_message
  end
end
