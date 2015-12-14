require_relative 'enigma'
require_relative 'encryptor'
require_relative 'constants'

class Dycryptor

  def initialize(encrypted_message, date, key)
    @encrypted_message = message
    @char_set = Constants::CHARSET.split(//)
  end

  def decrypt
    plaintext = ""
    @encrypted_message.split(//).each_with_index do |char, num|
      
    end
  end
