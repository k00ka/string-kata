module StringCalculator
  def self.add(string)
    return 0 if string == "" 
    validate(string)
    delimiter = cal_delimiter(string)
    string.gsub("\n", delimiter).split(delimiter).select{|num| num.size <= 3 || num == "1000"}.map(&:to_i).reduce(:+)
  end

  def self.cal_delimiter(string)
    delimiter = ","
    if string.include?("//")
      if string =~ /\/\/\[.+\]/
        delimiter = string.scan(/\/\/\[(.+)\]/).flatten[0]
      else 
        delimiter = string[2]
      end
    end
    delimiter
  end

  def self.validate(string) 
    neg_numbers = string.scan(/-\d+/)
    if neg_numbers.size == 1
      raise "You have a negative number"
    elsif neg_numbers.size > 1
      raise "You have these negative numbers: #{neg_numbers}"
    end
  end
end
