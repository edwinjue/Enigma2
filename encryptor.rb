require_relative 'constants'
require 'pry'

class Encryptor

  attr_accessor :message, :key, :date

  def initialize(message, key, date)
    # @date_key
    @message = message
    #puts "Inside Encryptor::initialize, message = " + message
    @key = key
    @date = date
    @char_set = Constants::CHARSET.split(//)
    @num_digits = Constants::CHARSET.split(//).length.to_s.length
    #to determine the number of digits we are working with for each character
  	#for example: when length of charset reaches 100, we need to make sure '5'
    # gets padded like '005'
    @rotation_array = key_rotation(@key)
    puts "@rotation_array = " + @rotation_array.inspect
    @offset_array = process_date(@date)
    puts "@offset_array = " + @offset_array.inspect
    @total_offset = [@offset_array,@rotation_array].transpose.map{|arr|
      arr.map!{ |x| x.to_i }
      arr.reduce(:+)
    }
    puts "@total_offset = " + @total_offset.inspect
  end

  def encrypt
    encryptext = ""
    @message.split(//).each_with_index do |char, num|
      current_position = @char_set.index(char)
      current_offset = @total_offset[num % 4] #@offset_array.length]
      #current_rotation = @rotation_array[num % 4] #@rotation_array.length]
      #segment = (current_position.to_i + current_offset.to_i + current_rotation.to_i) % char_set.index
      segment = (current_position.to_i + current_offset.to_i) % @char_set.length
      #encryptext << "%0#{@num_digits}d" % segment.to_s - puts out to number
      encryptext << @char_set[segment]
    end
    puts "Inside Encryptor::encrypt, encryptext = " + encryptext

    return encryptext
  end

  def key_rotation(key) #creates 2 digit custom code for ABCD
      a_key_rotation = key[0..1]
      b_key_rotation = key[1..2]
      c_key_rotation = key[2..3]
      d_key_rotation = key[3..4]

      [a_key_rotation, b_key_rotation, c_key_rotation, d_key_rotation]
  end

  def process_date(date)
    date_squared = date.to_i ** 2
    #puts "date_squared = " + date_squared.to_s
    off_sets = date_squared.to_s.split("")[-4..-1].join
    #puts "off_sets = " + off_sets.to_s
    a_date_gen = off_sets[-4].to_i
    b_date_gen = off_sets[-3].to_i
    c_date_gen = off_sets[-2].to_i
    d_date_gen = off_sets[-1].to_i
    [a_date_gen, b_date_gen, c_date_gen, d_date_gen]
  end

end
