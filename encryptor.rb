require_relative 'cryptkeeper'
require_relative ' constants'
require 'pry'

class Encryptor

  def initialize
    @date_key
    @key

  end

  def hang_man #generates number code based on location of character
    charSet[(charSet.index('w')+69)%(charSet.length)]
  end

  def incomming_message(incoming)
    imput = "#{incoming}".split(//)
  end

  def convert
    incoming to numbers in Constants
    end

  def secert_code

end
