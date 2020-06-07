require './test/test_helper'
require './lib/message'

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
end
