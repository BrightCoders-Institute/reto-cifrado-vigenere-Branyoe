
require 'minitest/autorun'
require_relative '../models/vigenere_encrypter'

class VigenereEncrypterTest < Minitest::Test
  def setup
    @encrypter = VigenereEncrypter.new
  end

  # no funciona
  def test_encrypt
    assert_equal "ZSNR", @encrypter.encrypt("hola", "SECRETO")
    assert_equal "TJEC", @encrypter.encrypt("RUBY", "codec")
    assert_equal "JIIX", @encrypter.encrypt("test", "pepe")
  end
end
