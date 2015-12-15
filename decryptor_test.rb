require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

require_relative 'decryptor'

class DecryptorTest < Minitest::Test

  def test_key_generates_5_digit_number
    "%05d" % Random.new.rand(99999)
    assert_equal 5, decrypter.@key 
  end

  def test_key_generates_radom_5_digit_number

  end

  def test_total_off_set_has_combine_date_and_key_codes

  end

  def test_date_code_outputs_last_4_numbers_of_sqaured_total

  end

  def test_process_date_is_sqaured
    date = Time.now.strftime("%d%m%y") ** 2
    assert
  end

  def test_decrypt_converts_encrypted_message

  end


end


end
