# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../models/vigenere_cipher'

# class MyTest < MiniTest::Test
#   def test_something
#     assert_equal 2, 1 + 1
#   end
# end

# class Addition
#   def one_plus_one
#     1 + 1
#   end
# end

describe VigenereCipher do
  before do
    @secret = 'hello'
    @vigenere_encrypter = VigenereCipher.new(@secret)
  end

  describe "when 'goodmorning' is entered as a message an secret key is #{@secret}" do
    spect_result = 'hellohelloh'
    it "the result should be #{spect_result}" do
      assert_equal 'hellohelloh', @vigenere_encrypter.encrypt('goodmorning')
    end
  end

  describe "when 'hi' is entered as a message an secret key is #{@secret}" do
    spect_result = 'he'
    it "the result should be '#{spect_result}'" do
      assert_equal spect_result, @vigenere_encrypter.encrypt('hi')
    end
  end
end
