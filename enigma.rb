require_relative 'constants'
require_relative 'encryptor'
require_relative 'decryptor'
require 'pry'
require 'date'

class Enigma

    attr_reader :date_key, :key

    def initialize
      # @date_key = Time.now
      # @key = key_gen
    end

    def encrypt(message, key =nil, date = nil)
      if key.nil?
        encrypt_key = create_new_key
      else
        encrypt_key = key
      end
      if date.nil?
        date_key = Time.now.strftime("%d%m%y")
      else
        date_key = date
      end
      encryptor = Encryptor.new(message,encrypt_key,date_key)
      encryptor.encrypt
    end

    def decrypt(encrypted_message, key, date)
      decryptor = Decryptor.new(encrypted_message, key, date)
      decryptor.decrypt
    end

    def create_new_key
       "%05d" % Random.new.rand(99999)
    end

end

e = Enigma.new
my_message = "can't figure this out"
output = e.encrypt(my_message,'34682','121215')
puts "output = " + output.to_s
plaintext = e.decrypt(encrypted_message, '34682', '121215')
puts "plaintext = " + plaintext.to_s
