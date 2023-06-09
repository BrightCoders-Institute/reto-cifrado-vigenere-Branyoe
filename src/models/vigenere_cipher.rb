

class VigenereCipher
  def initialize(secret_key)
    @secret_key = secret_key
    @alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "Ñ", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    @table = generate_table
    @char_numbers = {
      "A" => 0,
      "B" => 1,
      "C" => 2,
      "D" => 3,
      "E" => 4,
      "F" => 5,
      "G" => 6,
      "H" => 7,
      "I" => 8,
      "J" => 9,
      "K" => 10,
      "L" => 11,
      "M" => 12,
      "N" => 13,
      "Ñ" => 14,
      "O" => 15,
      "P" => 16,
      "Q" => 17,
      "R" => 18,
      "S" => 19,
      "T" => 20,
      "U" => 21,
      "V" => 22,
      "W" => 23,
      "X" => 24,
      "Y" => 25,
      "Z" => 26
    }    
  end

  def print_table
    for axisY in 0...@table.length do
      for axisX in 0...@table.length do
        print @table[axisY][axisX]
      end
      puts
    end
  end

  def encrypt(message)
    adapted_secret_key = adapt_secret_key(message, @secret_key)
    str = ""
    for i in 0...message.length do
      str = "#{str}#{@table[@char_numbers[message[i]]][@char_numbers[adapted_secret_key[i]]]}"
    end
    return str
  end

  def decrypt(code)
    adapted_secret_key = adapt_secret_key = adapt_secret_key(code, @secret_key)
    str = ""
    for axisY in 0...code.length do
      for axisX in 0...@alphabet.length do
        char = @table[@char_numbers[adapt_secret_key[axisY]]][axisX]
        if char == code[axisY] then str = "#{str}#{@table[0][axisX]}" end
      end 
    end
    return str
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
    return new_key = new_key[0...message.length]
  end

  def generate_table
    table = Array.new(27) { Array.new(27) }
    for axisY in 0...table.length do
      for axisX in 0...table.length do
        alphabet_index = (@alphabet.length-axisY-axisX)*-1
        table[axisY][axisX] = @alphabet[alphabet_index]
      end
    end
    return table
  end
end
