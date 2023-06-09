

class VigenereCipher
  attr_accessor :adapted_secret_key
  
  def initialize(secret_key)
    @secret_key = secret_key
    @adapted_secret_key = secret_key
    @alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "Ñ", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    @table = generate_table
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
    if message.length > @adapted_secret_key.length
      loop do
        @adapted_secret_key = "#{@adapted_secret_key}#{@secret_key}"
        break if message.length <= @adapted_secret_key.length
      end
    end

    @adapted_secret_key = @adapted_secret_key[0...message.length]
  end

  private

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
