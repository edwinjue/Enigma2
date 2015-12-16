require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

require '../lib/decryptor'
require '../lib/encryptor'

class DecryptorTest < Minitest::Test

  def test_decryptor_will_not_reveal_message_with_invalid_key
    message = "Your my Favorite Instructor ..end.."
    enc = Encryptor.new(message, "12345", "171215")
    encrypted_message = enc.encrypt
    dec = Decryptor.new(encrypted_message, "54321", "171215")
    plaintext = dec.decrypt
    refute_equal message, plaintext
  end

  def test_decryptor_will_not_reveal_message_with_invalid_date
    message = "Your my Favorite Instructor ..end.."
    enc = Encryptor.new(message, "12345", "151215")
    encrypted_message = enc.encrypt
    dec = Decryptor.new(encrypted_message, "12345", "171115")
    plaintext = dec.decrypt
    refute_equal message, plaintext
  end

  def test_decryptor_will_not_reveal_message_with_invalid_key_and_invalid_date
    message = "Your my Favorite Instructor ..end.."
    enc = Encryptor.new(message, "12345", "151215")
    encrypted_message = enc.encrypt
    dec = Decryptor.new(encrypted_message, "54321", "151515")
    plaintext = dec.decrypt
    refute_equal message, plaintext
  end

end
