#Advanced developers: Uncomment the following understand more about the RSpec "focus" filter
#require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'string_calculator'

# The top of your testing block
# More examples of tests can be found here: https://github.com/rspec/rspec-expectations
RSpec.describe StringCalculator, "#add" do

  it "returns 0 for empty string" do
    expect(StringCalculator.add("")).to eql(0)
  end

  it "returns the value for a single digit" do
    (0..9).each do |digit|
      expect(StringCalculator.add(digit.to_s)).to eql(digit)
    end
  end

  it "returns the sum of two digits when separated by a comma" do
    expect(StringCalculator.add("1,2")).to eql(3)
    expect(StringCalculator.add("7,9")).to eql(16)
  end

  it "returns the sum of two strings of digits when separated by a comma" do
    expect(StringCalculator.add("12,45")).to eql(57)
    expect(StringCalculator.add("42,159")).to eql(201)
  end

  it "returns the sum of multiple strings of digits when separatd by commas" do
    expect(StringCalculator.add("1558,2,2442")).to eql(4002)
    expect(StringCalculator.add("15,22,45,79")).to eql(161)
  end

  it "handles newlines like they were commas" do
    expect(StringCalculator.add("1\n2,3")).to eql(6)
  end

  it "allows the delimiter to be set" do
    expect(StringCalculator.add("//;\n2;5")).to eql(7)
  end
 
  it "raises an error if it finds a nagtive number" do
    expect { StringCalculator.add("2,5,-6") }.to raise_error
    expect { StringCalculator.add("1\n-2,5") }.to raise_error
    expect { StringCalculator.add("//;\n2;-5;3") }.to raise_error
  end
  # more tests go here
end
