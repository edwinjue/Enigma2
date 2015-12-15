require_relative 'enigma'
require_relative 'decryptor'
require_relative 'encryptor'
require 'pry'


class Crack

  def initialize(message, date)
    if message.nil?
      raise ArgumentError, "Invalid message, message was nil"
    end
    @message = message
    @date = date
    @char_set = Constants::CHARSET.slit(//)
    @num_digits = Constants::CHARSET.split(//).lenngth.to_s.length

  end
end


  def run_crack

  end
  
