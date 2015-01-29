#Advanced developers: Uncomment the following understand more about the RSpec "focus" filter
#require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'string_calculator'

# The top of your testing block
# More examples of tests can be found here: https://github.com/rspec/rspec-expectations
RSpec.describe StringCalculator, "#add" do

  it "returns 0 for empty string" do
    expect(StringCalculator.add("")).to eql(0)
  end

  it "returns 0 for the string '0'" do
    expect(StringCalculator.add("0")).to eql(0)
  end

  it "returns 5 for the string '5'" do
    expect(StringCalculator.add("5")).to eql(5)
  end
 
  it "returns 3 for the string '1,2'" do
    expect(StringCalculator.add("1,2")).to eql(3)
  end

  it "returns 16 for the string '7,9'" do
    expect(StringCalculator.add("7,9")).to eql(16)
  end

  it "returns 57 for the string '12,45'" do
    expect(StringCalculator.add("12,45")).to eql(57)
  end

  it "returns 201 for the string '42,159'" do
    expect(StringCalculator.add("42,159")).to eql(201)
  end

  it "returns 4002 for the string '1558,2,2442'" do
    expect(StringCalculator.add("1558,2,2442")).to eql(4002)
  end

  it "returns 161 for the string '15,22,45,79'" do
    expect(StringCalculator.add("15,22,45,79")).to eql(161)
  end

  it "returns 6 for the string '1\n2,3'" do
    expect(StringCalculator.add("1\n2,3")).to eql(6)
  end

  it "returns 7 for the string '//;\n2;5'" do
    expect(StringCalculator.add("//;\n2;5")).to eql(7)
  end

  it "throws exception when the string contains a negative number" do
    expect { StringCalculator.add("-1") }.to raise_error
  end

  it "does not throw and exception when the string contains a negative number and a dash is the delimiter" do
    expect { StringCalculator.add("//-\n2-1") }.to_not raise_error
  end

  it "throws simple exception when the string contains a single negative number" do
    expect { StringCalculator.add("2,-1") }.to raise_error("Cannot handle negative numbers.")
  end

  it "throws compound exception when the string contains multiple negative numbers" do
    expect { StringCalculator.add("-15,-3") }.to raise_error("Cannot handle negative numbers (-15, -3).")
  end

  it "throws compound exception when the string contains multiple negative numbers and some positives" do
    expect { StringCalculator.add("-15,5,-22,13") }.to raise_error("Cannot handle negative numbers (-15, -22).")
  end
  
  # more tests go here
end
