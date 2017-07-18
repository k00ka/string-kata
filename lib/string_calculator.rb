module StringCalculator

  def self.add(string)
    delim, string = extract_delim(string)
    string.gsub!(/\n/, delim)
    return to_i_with_raise(string) unless string.include?delim 
    digit_strings = string.split(delim)
    digit_strings.inject(0) { |t,s| t + to_i_with_raise(s) }
  end

  def self.extract_delim(string)
    delim = ","
    return delim, string unless string[0..1] == "//"
    delim = string[2]
    [ delim, string[4..-1] ]
  end

  def self.to_i_with_raise(string)
    i = string.to_i
    raise "No negatives!" if i < 0
    i
  end

  # ...and here when the above becomes too complex.

end
