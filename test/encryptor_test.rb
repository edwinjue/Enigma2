require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

require '../lib/encryptor'

class EncryptorTest < Minitest::Test

  def test_key_generates_5_digit_number
    enc = Encryptor.new('my message')
    key = enc.key
    assert 5, key.length
  end

  def test_key_generates_radom_5_digit_number
    expected_key = '12345'
    10.times do
      dec = Encryptor.new('my message')
      key = dec.key
      refute key.eql?(expected_key)
    end
  end

  def test_total_off_set_has_combine_date_and_key_codes
    expected_rotation = [12, 23, 34, 45] #for reference - rotation from key 12345
    expected_offset = [6, 2, 2, 5]  #for referece - date offsets for date 121515
    expected_total_offset = [18, 25, 36, 50]  #for reference - computed total from above
    enc = Encryptor.new('my message','12345','151215')
    assert_equal 0, (enc.total_offset[0].to_i-expected_total_offset[0].to_i)
    assert_equal 0, (enc.total_offset[1].to_i-expected_total_offset[1].to_i)
    assert_equal 0, (enc.total_offset[2].to_i-expected_total_offset[2].to_i)
    assert_equal 0, (enc.total_offset[3].to_i-expected_total_offset[3].to_i)
  end

  def test_encrypt_ouputs_encrypted_message
    enc = Encryptor.new("my_message")
    encrypted_message = enc.encrypt
    refute_equal "my_message", encrypted_message
    end


end
