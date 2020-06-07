class Message
  attr_reader :message,
              :key,
              :date

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
  end

  def alphabet
    ("a".."z").to_a << " "
  end

  def keys
    Key.new(key).create_keys
  end

  def offsets
    Offset.new(date).create_offset
  end
end
