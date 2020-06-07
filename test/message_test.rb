require './test/test_helper'
require './lib/message'

class MessageTest < Minitest::Test
  def setup
    @message = Message.new("hello world", "02715", "040895")
  end

  def test_it_exists
    assert_instance_of Message, @message
  end
end
