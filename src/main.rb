# frozen_string_literal: true

require_relative 'models/vigenere_cipher'

my_encrypter = VigenereCipher.new('CODEC')
puts my_encrypter.encrypt("RUBY")
puts my_encrypter.decrypt(my_encrypter.encrypt("RUBY"))