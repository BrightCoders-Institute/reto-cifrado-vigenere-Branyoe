require_relative './vigenere_cipher'
require_relative './utils'

class App
  def initialize
    @encrypter = VigenereCipher.new
  end

  
  def run
    loop do
      
      print "-----[Cifrado Vigenere]_----\n\n"
      puts "1. Encrypt."
      print "2. Desencryp.\n\n"
      option = 0
      loop do
        option = get_data("number option", true)
        break unless option < 1 || option > 2
      end
      system("cls")
      navigator(option) 
      
      print 'press any key to continue, press "ctrl+c" to exit.'
      gets.chomp
      system("cls")
    end
  end

  private

  def navigator option
    if option == 1 then show_menu else show_menu(false) end
  end

  def show_menu(encrypt = true)
    print "\n---#{encrypt ? "Encrypt" : "Decrypt"}---\n\n"
    input = get_data(encrypt ? "message": "code")
    key = get_data("key")
    print "\nMensaje original: #{input}\n"
    print "#{encrypt ? 'Encrypted' : 'Decrypted'} message: #{
      encrypt ? @encrypter.encrypt(input, key) : @encrypter.decrypt(input, key)
    }\n\n"
  end
  
  def get_data(data_type, only_numbers = false)
    input = ""
    loop do
      print "-> Type a #{data_type}: "
      input = gets.chomp.strip.upcase
      break if (only_numbers ? Utils.contain_only_numbers?(input) : Utils.contain_only_letter?(input)) 
    end
    return only_numbers ? input.to_i : input                                        
  end
end