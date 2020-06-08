require_relative 'enigma'

enigma = Enigma.new

file = File.open(ARGV[0], "r")

encrypted_message = file.read
file.close

key = ARGV[2]
date = ARGV[3]

decrypted_message = enigma.dycrypt(encrypted_message, key, date)

write = File.open(ARGV[1], "w")

write.write(decrypted_message[:decryption])
write.close

p "Created '#{ARGV[1]}' with the key #{decrypted_message[:key]} and date #{decrypted_message[:date]}"
