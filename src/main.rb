# frozen_string_literal: true

require_relative 'models/vigenere_cipher'

my_encrypter = VigenereCipher.new('secreto')

# my_encrypter.encrypt('hola')

# puts my_encrypter.adapted_secret_key
my_encrypter.print_table