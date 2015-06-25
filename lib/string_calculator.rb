module StringCalculator

  def self.add(string)
    values = extract_values(string)
    raise_error_if_any_negatives(values)
    values.reduce(:+) || 0
  end

  def self.extract_values(string)
    delimiter = extract_delimiter(string)   
    string.split(/[#{delimiter}\n]/).map(&:to_i)
  end

  def self.extract_delimiter(string)
    (string =~ /^\/\//) ? string[2] : ","
  end

  def self.raise_error_if_any_negatives(values)
    negatives = extract_negatives(values)
    case negatives.length
    when 0
    when 1
      raise "Cannot handle negative numbers."
    else
      raise "Cannot handle negative numbers (#{negatives.join(", ")})."
    end
  end

  def self.extract_negatives(values)
    values.select { |v| v < 0 }
  end

end
