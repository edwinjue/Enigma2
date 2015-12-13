
require_relative 'constants'
require 'pry'

class Encryptor

  attr_accessor :message, :key, :date

  def initialize(message, key, date)
    # @date_key
    @message = message
    @key = key
    @date = date
    @char_set = Constants::CHARSET.split(//)
    @num_digits = Constants::CHARSET.split(//).length.to_s.length
    #to determine the number of digits we are working with for each character
  	#for example: when length of charset reaches 100, we need to make sure '5'
    # gets padded like '005'
    @rotation_array = key_rotation(@key)
    @offset_array = process_date(@date)
  end

  def encrypt
    encryptext = ""
    @message.split(//).each_with_index do |char, num|
      current_position = @char_set.index(char)
      current_offset = @offset_array[num % 4] #@offset_array.length]
      current_rotation = @rotation_array[num % 4] #@rotation_array.length]
      segment = (current_position.to_i + current_offset.to_i + current_rotation.to_i) % char_set.index
    end
    encryptext << "%0#{@num_digits}d" % segment.to_s
  end

  end

  def key_rotation(key) #creates 2 digit custom code for ABCD
      @a_key_rotation = key[0..1].to_i
      @b_key_rotation = key[1..2].to_i
      @c_key_rotation = key[2..3].to_i
      @d_key_rotation = key[3..4].to_i

      puts   [@a_key_rotation,
              @b_key_rotation,
              @c_key_rotation,
              @d_key_rotation]
  end

  def process_date(date)
    date_squared = date.to_i ** 2
    puts "date_squared = " + date_squared.to_s
    off_sets = date_squared.to_s.split("")[-4..-1].join
    puts "off_sets = " + off_sets.to_s
    a_date_gen = off_sets[-4].to_i
    b_date_gen = off_sets[-3].to_i
    c_date_gen = off_sets[-2].to_i
    d_date_gen = off_sets[-1].to_i

    puts [a_date_gen, b_date_gen, c_date_gen, d_date_gen]
  end

  # def date_rotation #creates custom digit for ABCD
  #   date_generator
  #   @a_date_gen = @off_sets[-4].to_i
  #   @b_date_gen = @off_sets[-3].to_i
  #   @c_date_gen = @off_sets[-2].to_i
  #   @d_date_gen = @off_sets[-1].to_i
  #
  #   return [@a_date_gen, @b_date_gen, @c_date_gen, @d_date_gen]
  # end

  def off_set_rotation #combines key and date to give rotation
    date_rotation
    date_generator
    @a_rotation_code = @a_date_gen.to_i + @a_key_rotation.to_i
    puts "@a_rotation_code" + @a_rotation_code.to_s
    @b_rotation_code = @b_date_gen.to_i + @b_key_rotation.to_i
    puts "@b_rotation_code" + @b_rotation_code.to_s
    @c_rotation_code = @c_date_gen.to_i + @c_key_rotation.to_i
    puts "@c_rotation_code" + @c_rotation_code.to_s
    @d_rotation_code = @d_date_gen.to_i + @d_key_rotation.to_i
    puts "@d_rotation_code" + @d_rotation_code.to_s

    puts [@a_rotation_code, @b_rotation_code,
            @c_rotation_code, @d_rotation_code]
  end



=begin
  def hang_man #generates number code based on location of character
    charSet[(charSet.index('w')+69)%(charSet.length)]
  end

  def incomming_message(incoming)
    #goal is to have the incoming message to
    #convert into the number of the Constant
    imput = "#{incoming}".split(//)
  end

  def convert
    #GOAL - is to have the incomming_message + the ABCD to return new coded value
    #forward rotation
    end

  def secert_code
=end
