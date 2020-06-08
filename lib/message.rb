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
    Key.new(@key).create_keys
  end

  def offsets
    Offset.new(@date).create_offset
  end

  def shifts
    init_shift = {
      A: keys[:A] + offsets[:A],
      B: keys[:B] + offsets[:B],
      C: keys[:C] + offsets[:C],
      D: keys[:D] + offsets[:D]
    }
    final_shift = {}
    init_shift.each do |letter, shift|
      until shift < 27
        shift -= 27
      end
      final_shift[letter] = shift
    end
    final_shift
  end

  def encrypt_message
    split_message = @message.downcase.split(//)
    encrypted_message = []
    counter = 0
    split_message.each do |character|
      if alphabet.include?(character) == false
        encrypted_message << character
      elsif counter == 0 || counter % 4 == 0
        encrypted_message << alphabet[alphabet.index(character) - (27 - shifts[:A])]
      elsif counter == 1 || counter % 4 == 1
        encrypted_message << alphabet[alphabet.index(character) - (27 - shifts[:B])]
      elsif counter == 2 || counter % 4 == 2
        encrypted_message << alphabet[alphabet.index(character) - (27 - shifts[:C])]
      elsif counter == 3 || counter % 4 == 3
        encrypted_message << alphabet[alphabet.index(character) - (27 - shifts[:D])]
      end
      counter += 1
    end
    encrypted_message.join
  end
end
