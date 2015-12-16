require_relative 'constants'
require_relative 'encryptor'
require_relative 'decryptor'
require_relative 'crack'
require 'pry'
require 'date'

class Enigma

    attr_reader :date_key, :key

    def initialize
      # @date_key = Time.now
      # @key = key_gen
    end

    def encrypt(message, key =nil, date = nil)
      encryptor = Encryptor.new(message,key,date)
      encryptor.encrypt
    end

    def decrypt(encrypted_message, key, date)
      decryptor = Decryptor.new(encrypted_message,key,date)
      decryptor.decrypt
    end

    def crack(encrypted_message, date = nil)
      crackle = Crack.new(encrypted_message,date)

      crackle.crackle
    end

end

e = Enigma.new
my_message = "jace4life ..end.."

key = "12345"
puts "key = " + key

puts "Calling encrypt w/ key"
encrypted_message = e.encrypt(my_message)
puts "encrypted_message = " + encrypted_message.to_s

puts "Calling decrypt"
decrypt_plaintext = e.decrypt(encrypted_message,key, Time.now)
puts "decrypt_plaintext = " + decrypt_plaintext.to_s

puts "Calling crack"
crack_plaintext = e.crack(encrypted_message)
puts "crack_plaintext = " + crack_plaintext.to_s

=begin
puts "-" * 10
puts "Calling encrypt (no key)"
encrypted_message = e.encrypt(my_message)
puts "encrypted_message = " + encrypted_message.to_s
puts "-" * 10
puts "Calling crack"
crack_plaintext = e.crack(encrypted_message)
#puts "crack_plaintext = " + crack_plaintext.to_s
=end
