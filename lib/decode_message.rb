class DecodeMessage
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
end
