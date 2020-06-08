class Enigma

  def initialize

  end

  def encrypt(message, key, date)
    new_message = Message.new(message, key, date)
    new_message.encrypt
  end

  def decrypt(message, key, date)
    new_message = Message.new(message, key, date)
    new_message.decrypt
  end
end
