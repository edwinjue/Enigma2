require 'pry'
binding.pry

class CryptKeeper

  def initialize
    @char_set = 'abcdefghijklmnopqrstuvwxyz0123456789., !@#$%^&*()<>;:/?\|'.split(//)
    @date = Time.now
  end

  def encrypt


  end


end


class Encryptor

  def initialize
      @date = Time.now
      @key = key
  end

  def my_time(now) #generates numbers code by date
    @date = Time.now
    @date.strftime("%d%m%y").to_i
    my_time = date * 2
    @date_key = my_time.to_s.split("")[-4..-1].join
  end

  def hang_man #generates number code based on location of character
    charSet[(charSet.index('w')+69)%(charSet.length)]
  end

  def key_rotation #generates random 5 key code
        # @random_num = "%05d" % rand(99999)
    @a_key_rotation = @ key[0..1].to_i
    @b_key_rotation = @ key[1..2].to_i
    @c_key_rotation = @ key[2..3].to_i
    @d_key_rotation = @ key[3..4].to_i

  end
end

m= MythodMan.new(Random.rand(0..99999).to_s)
m.key_rotation

best day ever = Time.now.strftime("%d%m%y").to_i
puts my_time



class Dycryptor

def initialize(encrypted_message, date, key)
  @decrypt = Encryptor.new(encrypted_message, date, key)
end

def negative_rotation
end

def decrypt
end

end
