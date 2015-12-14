require_relative 'enigma'
require_relative 'encryptor'
require_relative 'constants'

class Decryptor

  def initialize(encrypted_message, date, key)
    @encrypted_message = message
    @char_set = Constants::CHARSET.split(//)
    @rotation_array = key_rotation(@key)
    puts "@rotation_array = " + @rotation_array.inspect
    @offset_array = process_date(@date)
    puts "@offset_array = " + @offset_array.inspect
    @total_offset = [@offset_array,@rotation_array].transpose.map{|arr|
      arr.map!{ |x| x.to_i }
      arr.reduce(:+) }
    puts "@total_offset = " + @total_offset.inspect
  end
  end

  def decrypt
    plaintext = ""
    @encrypted_message.split(//).each_with_index do |char, num|

    end
  end

  def key_rotation(key) #creates 2 digit custom code for ABCD
      @a_key_rotation = key[0..1]
      @b_key_rotation = key[1..2]
      @c_key_rotation = key[2..3]
      @d_key_rotation = key[3..4]

      [@a_key_rotation, @b_key_rotation, @c_key_rotation, @d_key_rotation]
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
