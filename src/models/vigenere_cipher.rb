class VigenereCipher # rubocop:todo Style/Documentation
  # Encrypts a message using Vigenère cipher.
  #
  # @param message [String] The message to be encrypted.
  # @param key [String] The encryption key.
  # @return [String] The encrypted message.
  def encrypt(message, _key)
    # If the message length is greater than the adapted_secret_key length,
    # expand the adapted_secret_key to match the length of the message.
    if message.length > @adapted_secret_key.length
      loop do
        @adapted_secret_key = "#{@adapted_secret_key}#{@secret_key}"
        break if message.length <= @adapted_secret_key.length
      end
    end

    # Truncate the adapted_secret_key to the length of the message.
    @adapted_secret_key = @adapted_secret_key[0...message.length]
  end

  # Initializes a new instance of VigenereCipher.
  #
  # @param secret_key [String] The secret key for encryption.
  def initialize(secret_key)
    @secret_key = secret_key
    @adapted_secret_key = secret_key
  end

  # Accessor for the adapted_secret_key attribute.
  attr_accessor :adapted_secret_key
end
