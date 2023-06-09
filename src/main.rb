# frozen_string_literal: true

require_relative './models/app'

# my_encrypter = VigenereCipher.new('CODEC')
# puts my_encrypter.encrypt("RUBY")
# puts my_encrypter.decrypt(my_encrypter.encrypt("RUBY"))

# my_encrypter = VigenereCipher.new('SECRETO')
# puts my_encrypter.encrypt("HOLA")
# puts my_encrypter.decrypt(my_encrypter.encrypt("HOLA"))

puts App.new.run