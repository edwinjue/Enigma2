require_relative 'keygen'
require_relative 'dategen'
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
      kg = Keygen.new(key)  #kg.key will contain the secret key
      dg = Dategen.new(date)  #dg.key will contain the date key
      #encryptor = Encryptor.new(message,encrypt_key,date_key)
      encryptor = Encryptor.new(message,kg.key,dg.key)
      encryptor.encrypt
    end

    def decrypt(encrypted_message, key, date)
      kg = Keygen.new(key)
      dg = Dategen.new(date)
      #decryptor = Decryptor.new(encrypted_message,key,date)
      decryptor = Decryptor.new(encrypted_message,kg.key,dg.key)
      decryptor.decrypt
    end

    def crack(encrypted_message, date = nil)

      dg = Dategen.new(date)  #dg.key will contain the date key

      #crackle = Crack.new(encrypted_message,date_key)
      crackle = Crack.new(encrypted_message,dg.key)

      crackle.crackle
    end

end

e = Enigma.new
my_message = "jace4life ..end.."

key = "12345"
puts "key = " + key

puts "Calling encrypt w/ key"
encrypted_message = e.encrypt(my_message,key)
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
