require_relative 'constants'
require_relative ' encryptor'
require 'pry'
require 'date'

class Enigma

    attr_reader :date_key, :key

    def initialize
      # @date_key = Time.now
      # @key = key_gen
    end

    def encrypt(message, key =nil, date = nil)
      encryptor = Encryptor.new(message,key,date)
      encryptor.encrypt
    end

    def create_new_key
      @key = "%05d" % Random.new.rand(99999)
    end

    def key_rotation(key = nil) #creates 2 digit custom code for ABCD
      if key == nil
        @a_key_rotation = @key[0..1].to_i
        puts "@a_key_rotation" + @a_key_rotation.to_s
        @b_key_rotation = @key[1..2].to_i
        puts "@b_key_rotation" + @b_key_rotation.to_s
        @c_key_rotation = @key[2..3].to_i
        puts "@c_key_rotation" + @c_key_rotation.to_s
        @d_key_rotation = @key[3..4].to_i
        puts "@d_key_rotation" + @d_key_rotation.to_s
      else
        "%05d"
      end
    end

    def date_generator
      date = @date_key.strftime("%d%m%y").to_i
      date_squared = date ** 2
      puts "date_squared = " + date_squared.to_s
      @off_sets = date_squared.to_s.split("")[-4..-1].join
      puts "@off_sets = " + @off_sets.to_s
    end

    def date_rotation #creates custom digit for ABCD
      date_generator
      @a_date_gen = @off_sets[-4].to_i
      puts "@a_date_gen" + @a_date_gen.to_s
      @b_date_gen = @off_sets[-3].to_i
      puts "@b_date_gen" + @b_date_gen.to_s
      @c_date_gen = @off_sets[-2].to_i
      puts "@c_date_gen" + @c_date_gen.to_s
      @d_date_gen = @off_sets[-1].to_i
      puts "@d_date_gen" + @d_date_gen.to_s

      return [a,b,c,d]
    end

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
    end

end

ck = Enigma.new("some message")
ck.key_rotation('23451')
ck.off_set_rotation
