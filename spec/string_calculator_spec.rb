#Advanced developers: Uncomment the following understand more about the RSpec "focus" filter
#require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'string_calculator'

# The top of your testing block
# More examples of tests can be found here: https://github.com/rspec/rspec-expectations
RSpec.describe StringCalculator, "#add" do

  it "returns 0 for empty string" do
    expect(StringCalculator.add("")).to eql(0)
  end

  it 'returns 0 for  a value of "0"'do
    expect(StringCalculator.add("0")).to eql(0)
  end

  it 'returns 5 for  a value of "5"'do
    expect(StringCalculator.add("5")).to eql(5)
  end

  it 'returns 3 for  a value of "1,2"'do
    expect(StringCalculator.add("1,2")).to eql(3)
  end

  it 'returns 3 for  a value of "1,2"'do
    expect(StringCalculator.add("1,2")).to eql(3)
  end

  it 'returns 57 for  a value of "12,45"'do
     expect(StringCalculator.add("12,45")).to eql(57)
  end

  it 'returns 57 for  a value of "1558,2,2442"'do
     expect(StringCalculator.add("1558,2,2442")).to eql(4002)
  end

  it 'returns 6 for  a value of "1\n2,3"'do
     expect(StringCalculator.add("1\n2,3")).to eql(6)
  end

  it 'returns 7 for  a value of "//;\n2;5"'do
     expect(StringCalculator.add("//;\n2;5")).to eql(7)
  end

  it 'raises an exception when the string contains a negative number' do
    expect{StringCalculator.add("-1")}.to raise_error(RuntimeError,'You have a negative number')
  end

  it 'raises an exception when the string contains a negative number' do
    expect{StringCalculator.add("//:4:-145677")}.to raise_error(RuntimeError,'You have a negative number')
  end

  it 'It raises the following error "You have these negative numbers ["-2344", "-3267"]" for "//:-23:-32" ' do
    expect{StringCalculator.add("//:-2344:-3267")}.to raise_error(RuntimeError,'You have these negative numbers: ["-2344", "-3267"]')
  end

  it 'It ignores any number higher than 1000' do
    expect(StringCalculator.add("//:1345:\n4:4")).to eql(8)
  end

  it 'returns 6 for "//[a?>]4a?>1a?>1"' do
    expect(StringCalculator.add("//[a?>]4a?>1a?>1")).to eql(6)
  end
end
