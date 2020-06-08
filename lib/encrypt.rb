require_relative 'enigma'

enigma = Enigma.new

file = File.open(ARGV[0], "r")
file.close

message = file.read
file.close

encrypted_message = enigma.encrypt(message)

write = File.open(ARGV[1], "w")

write.write(encrypted_message[:encryption])
write.close

p "Created #{ARGV[1]} with the key #{encrypted_message[:key]} and date #{encrypted_message[:date]}"
