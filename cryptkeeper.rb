# require_relative 'encryptor'
# require_relative 'decryptor'
require_relative 'constants'
require 'pry'


class CryptKeeper

  attr_reader :date_key , :key

  def initialize(date_key,key)
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


    def date_generator
    @date_key = Time.now
    @date_key.strftime("%d%m%y").to_i
    date_generator = date ** 2
    puts "date_generator = " + date_generator.to_s
    @key_gen = date_generator.to_s.split("")[-4..-1].join
    puts "@key_gen = " + @key_gen.to_s
  end

  def date_rotation #creates custom digit for ABCD
    @a_date_gen = @date_key[-4].to_i
    puts "@a_date_gen" + @a_date_gen.to_s
    @b_date_gen = @date_key[-3].to_i
    puts "@b_date_gen" + @b_date_gen.to_s
    @c_date_gen = @date_key[-2].to_i
    puts "@c_date_gen" + @c_date_gen.to_s
    @d_date_gen = @date_key[-1].to_i
    puts "@d_date_gen" + @d_date_gen.to_s
  end

  # def off_set_rotation
  #   @a_date_key + @a_key = @a_rotation_code.to_i
  #   puts "@a_date_key" + "@a_key" + @a_date_key + @a_key.to_s
  #   @b_date_key + @b_key = @b_rotation_code.to_i
  #   puts "@b_date_key" + "@b_key" + @b_date_key + @b_key.to_s
  #   @c_date_key + @c_key = @c_rotation_code.to_i
  #   puts "@c_date_key" + "@c_key" + @c_date_key + @c_key.to_s
  #   @d_date_key + @d_key = @d_rotation_code.to_i
  #   puts "@d_date_key" + "@d_key" + @d_date_key + @d_key.to_s
  # end

  def off_set_rotation #combines key and date to give rotation
    @a_rotation_code = @a_date_gen + @a_key_rotation
    puts "@a_rotation_code" + @a_date_gen.to_s + @a_key_rotation.to_s
  #  puts "@a_date_gen" + "@a_key_rotation" + @a_date_gen + @a_key.to_s
    @b_rotation_code = @b_date_gen + @b_key_rotation
    puts "@b_rotation_code" + @b_date_gen.to_s + @b_key_rotation.to_s
  #  puts "@b_date_gen" + "@b_key_rotation" + @b_date_key + @b_key.to_s
    @c_rotation_code = @c_date_gen + @c_key_rotation
    puts "@c_rotation_code" + @c_date_gen.to_s + @c_key_rotation.to_s
  #  puts "@c_date_gne" + "@c_key_rotation" + @c_date_key + @c_key.to_s
    @d_rotation_code = @d_date_gen + @d_key_rotation
    puts "@d_rotation_code" + @d_date_gen.to_s + @d_key_rotation.to_s
  #  puts "@d_date_gen" + "@d_key_rotation" + @d_date_key + @d_key.to_s
  end

end

ck = CryptKeeper.new('121215', '23451')
ck.key_rotation('23451')
ck.off_set
ck.rotation

#need to figure out why rotation isn't working
