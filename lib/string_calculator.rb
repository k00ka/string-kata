module StringCalculator

  def self.add(string)
    delimiter, string = extract_delimiter(string)
    string.split(delimiter).inject(0) { |sum, x| sum + x.to_i }
  end

  def self.extract_delimiter(string)
    delimiter = /[,\n]/
    if string =~ /^\/\//
      delimiter = string[2]
      string = string[4..-1]
    end
    [ delimiter, string ]
  end

end
