# require_relative 'encryptor'
# require_relative 'decryptor'
require_relative 'constants'
require 'pry'


class CryptKeeper

  attr_reader :date_key, :key

  def initialize(date_key,key_gen)
    @date_key = Time.now.strftime("%d%m%y").to_i
    @key = key_gen
  end

  def create_new_key
		@key = "%05d" % Random.new.rand(99999)

	end

  def key_rotation(key) #creates 2 digit custom code for ABCD
    @a_key_rotation = @key[0..1].to_i
    puts "@a_key_rotation" + @a_key_rotation.to_s
    @b_key_rotation = @key[1..2].to_i
    puts "@b_key_rotation" + @b_key_rotation.to_s
    @c_key_rotation = @key[2..3].to_i
    puts "@c_key_rotation" + @c_key_rotation.to_s
    @d_key_rotation = @key[3..4].to_i
    puts "@d_key_rotation" + @d_key_rotation.to_s
  end


    def date_squared
    @date_key = Time.now
    @date_key.strftime("%d%m%y").to_i
    date_generator = date ** 2
    puts "date_generator = " + date_generator.to_s
    @key_gen = date_generator.to_s.split("")[-4..-1].join
    puts "@key_gen = " + @key_gen.to_s
  end

  def date_rotation #creates custom digit for ABCD
    date_generator
    @a_date_gen = @date_key[-4].to_i
    puts "@a_date_gen" + @a_date_gen.to_s
    @b_date_gen = @date_key[-3].to_i
    puts "@b_date_gen" + @b_date_gen.to_s
    @c_date_gen = @date_key[-2].to_i
    puts "@c_date_gen" + @c_date_gen.to_s
    @d_date_gen = @date_key[-1].to_i
    puts "@d_date_gen" + @d_date_gen.to_s
  end



  def off_set_rotation #combines key and date to give rotation
    date_squared
    @a_rotation_code = @a_date_gen + @a_key_rotation
    puts "@a_rotation_code" + @a_date_gen.to_s + @a_key_rotation.to_s
    @b_rotation_code = @b_date_gen + @b_key_rotation
    puts "@b_rotation_code" + @b_date_gen.to_s + @b_key_rotation.to_s
    @c_rotation_code = @c_date_gen + @c_key_rotation
    puts "@c_rotation_code" + @c_date_gen.to_s + @c_key_rotation.to_s
    @d_rotation_code = @d_date_gen + @d_key_rotation
    puts "@d_rotation_code" + @d_date_gen.to_s + @d_key_rotation.to_s
  end

end

ck = CryptKeeper.new('121215','23451')
ck.key_rotation('23451')
ck.off_set_rotation
