require 'pry'


class Crack

  def initialize(message, date)
    if message.nil?
      raise ArgumentError, "Invalid message, message was nil"
    end
    @rotation_array = []
    @message = message
    @date = date
    @char_set = Constants::CHARSET.split(//)
    @num_digits = Constants::CHARSET.split(//).length.to_s.length
    @offset_array = process_date(@date)
    puts "@offset_array = " + @offset_array.inspect
  end

  def crackle
    rotation_array = []
    #rotation_array = (current_position - original_position - current_date_offset)
    def rotation_index
      last_dot_rotation_index = (@message.length-1) % 4
      second_to_last_dot_rotation_index = (@message.length-2) % 4
      d_rotation_index = (@message.length-3) % 4
      n_rotation_index = (@message.length-4) % 4
    end

    def offset
      #date offset values using indicies above
      last_dot_offset = @offset_array[last_dot_rotation_index]
      second_to_last_dot_offset = @offset_array[second_to_last_dot_rotation_index]
      d_rotation_offset = @offset_array[d_rotation_index]
      n_rotation_offset = @offset_array[n_rotation_index]
    end

    def end_position #positions in the charset of original unencrypted characters
      dot_position = @char_set.index('.')
      d_position = @char_set.index('d')
      n_position = @char_set.index('n')
    end

    def encrypted_character #positions in the charset of encrypted characters
      encrypted_last_character = @char_set.index(@message[-1])
      encrypted_second_to_last_character = @char_set.index(@message[-2])
      encrypted_third_to_last_character = @char_set.index(@message[-3])
      encrypted_fourth_to_last_character = @char_set.index(@message[-4])
    end

    def rotation_array
      rotation_array[last_dot_rotation_index] = (encrypted_last_character - dot_position -last_dot_offset) % @char_set.length
      rotation_array[second_to_last_dot_rotation_index] =  (encrypted_second_to_last_character - dot_position - second_to_last_dot_offset) % @char_set.length
      rotation_array[d_rotation_index] = (encrypted_third_to_last_character - d_position - d_rotation_offset) % @char_set.length
      rotation_array[n_rotation_index] = (encrypted_fourth_to_last_character - n_position - n_rotation_offset) % @char_set.length
      puts "rotation_array = " + rotation_array.inspect
    end
    def incruements
      increment = @char_set.length
      a_rot = generate_increments(rotation_array[0], increment).map { |val| "%02d" % val.to_s }
      b_rot = generate_increments(rotation_array[1], increment).map { |val| "%02d" % val.to_s }
      c_rot = generate_increments(rotation_array[2], increment).map { |val| "%02d" % val.to_s }
      d_rot = generate_increments(rotation_array[3], increment).map { |val| "%02d" % val.to_s }
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

    #generate all the possible iterations of rotation values
    def generate_increments(rotation_value,increment)
      #puts "processing rotation value: #{rotation_value}"
      increments_array = []

      i=1
      loop do
        increments_array << (rotation_value - (increment*i)) % @num_digits
        #puts 'rotation_value - (increment*i)=' + (rotation_value - (increment*i)).to_s
        if (rotation_value - (increment*i)) < 0
          break
        end
        i += 1
      end

      increments_array << rotation_value

      i = 1
      loop do
        if rotation_value + (increment*i) >= (10 ** @num_digits)
          break
        end
        increments_array << rotation_value + (increment*i)
        i += 1
      end

      increments_array
    end
  end