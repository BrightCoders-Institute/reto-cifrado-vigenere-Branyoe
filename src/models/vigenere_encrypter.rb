# frozen_string_literal: true

require_relative '../utils/letter_numbers'

# This class is responsible for encrypting and decrypting messages using the Vigenere method.
class VigenereEncrypter
  def initialize
    @alphabet = %w[A B C D E F G H I J K L M N Ñ O P Q R S T U V W X Y Z]
    @table = generate_table
    @letter_numbers = LetterNumbers.new.letter_numbers
  end

  def print_table
    @table.each do |row|
      row.each do |value|
        print value
      end
      puts
    end
  end

  def encrypt(message, key)
    return '' if message.nil? || key.nil?

    adapted_secret_key = adapt_secret_key(message, key)
    str = ''
    message.each_char.each_with_index do |char, i|
      str += @table[@letter_numbers[char]][@letter_numbers[adapted_secret_key[i]]]
    end
    str
  end

  def decrypt(code, key)
    adapted_secret_key = adapt_secret_key(code, key)
    str = ''
    code.chars.each_with_index do |char, axis_y|
      char = @table[0][@letter_numbers[char] - @letter_numbers[adapted_secret_key[axis_y]]]
      str += char
    end
    str
  end

  private

  def adapt_secret_key(message, key)
    new_key = key
    if message.length > key.length
      loop do
        new_key = "#{new_key}#{key}"
        break if message.length <= new_key.length
      end
    end
    new_key = new_key[0...message.length]
  end

  def generate_table
    table = Array.new(27) { Array.new(27) }
    table.each_with_index do |row, axis_y|
      row.each_with_index do |_value, axis_x|
        alphabet_index = (@alphabet.length - axis_y - axis_x) * -1
        table[axis_y][axis_x] = @alphabet[alphabet_index]
      end
    end
    table
  end
end
