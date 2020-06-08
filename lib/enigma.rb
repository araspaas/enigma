class Enigma

  def initialize

  end

  def encrypt(message, key, date = Date.today.strftime("%m%d%y"))
    new_message = Message.new(message, key, date)
    new_message.encrypt
  end

  def decrypt(message, key, date = Date.today.strftime("%m%d%y"))
    new_message = Message.new(message, key, date)
    new_message.decrypt
  end
end
