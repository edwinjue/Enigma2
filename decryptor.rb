class Dycryptor

def initialize(encrypted_message, date, key)
  @decrypt = Encryptor.new(encrypted_message, date, key)
end

def negative_rotation
end

def decrypt
end

end
