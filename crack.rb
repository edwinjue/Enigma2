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
    @char_set = Constants::CHARSET.split(//)
    @num_digits = Constants::CHARSET.split(//).length.to_s.length
    @offset_array = process_date(@date)
    puts "@offset_array = " + @offset_array.inspect
  end

  def crackle
    current_date_offset = @offset_array[@message.length % 4]
    #rotation_array = (current_position - original_position - current_date_offset)
    #% @char_set.lengthend
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
