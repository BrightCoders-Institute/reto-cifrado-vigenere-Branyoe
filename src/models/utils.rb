class Utils
  def self.contain_only_letter?(str)
    /^[a-zA-Z]+$/i.match?(str)
  end

  def self.contain_only_numbers?(str)
    /^[0-9]+$/.match?(str)
  end
end