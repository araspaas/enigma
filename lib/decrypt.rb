require './lib/enigma'

enigma = Enigma.new

handle = File.open(ARGV[0], "r")

encrypted_message = handle.read
handle.close

key = ARGV[2]
date = ARGV[3]

decrypted_message = enigma.decrypt(encrypted_message, key, date)
writer = File.open(ARGV[1], "w")

writer.write(decrypted_message[:decryption])
writer.close

p "Created '#{ARGV[1]}' with the key #{decrypted_message[:key]} and date #{decrypted_message[:date]}"
