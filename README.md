String Calculator Kata TDD Workshop
=====================================

This repo contains an exercise for our third workshop. This one is on TDD. For this session we have based our activities on Roy Osherove's String Calculator kata.

We've restructured the repository to provide a quick-start to TDD with RSpec and to mimic the setup we used last time. The code to be created is found in the ``lib/`` directory, and we have supplied unit tests in the ``spec/`` directory.

###Setup

Here are the steps to get you started with the repo. We assume, naturally, that you have a working development machine with Ruby 1.9 or better on it. At Ryatta Group we use rbenv, and so we've included some optional elements - just skip them if you're using rvm or are not versioning your Ruby.

```sh
% git clone git@github.com:k00ka/string-kata.git
% cd string-kata
% gem install bundler
Fetching: bundler-1.7.4.gem (100%)
Successfully installed bundler-1.7.4
1 gem installed
% bundle
Fetching gem metadata from https://rubygems.org/.........
Resolving dependencies...
Installing rake 10.3.2
...
Using bundler 1.7.4
Your bundle is complete!
Use `bundle show [gemname]` to see where a bundled gem is installed.
```
######Note: if you use rbenv...
```sh
% rbenv rehash
```
You are (almost) there!

###Simple TDD workflow
I’m going to give you some directions for what your solution should do.
You are going to:
. write a test or tests that translate my request into code
. demonstrate to yourself that those test(s) fail
. implement mods to make the tests pass

###Tips of TDD
Implement the simplest code you can imagine to make the tests pass.
Once the tests pass, refactor the code to simplify it.
Let earlier tests stand, they will catch regressions.

###How to test

There is an empty file (well, almost empty) in the ``lib/`` directory. It is called ``string_calculator.rb``. This is part 1 of your deliverable.

There is a unit test file in the ``spec/`` directory called ``string_calculator_spec.rb``. This is part 2 of your deliverable.

To "pass" Math class, you need to make both files work together.
To run the tests we have written against the code we've developed, do the following:
```sh
%rspec
F

Failures:

  1) StringCalculator#add returns 0 for empty string
     Failure/Error: expect("").to eq(0)
       
       expected: 0
            got: ""
       
       (compared using ==)
     # ./spec/string_calculator_spec.rb:11:in `block (2 levels) in <top (required)>'

Finished in 0.00108 seconds (files took 0.10543 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./spec/string_calculator_spec.rb:10 # StringCalculator#add returns 0 for empty string
``

The text ``1 failure`` means you're going to "fail" Math! Now go fix some code and share what you've learned with the group.

###Final Notes




















STOP!
DO NOT GO BEYOND THIS POINT
BELOW ARE THE SPECIFICATIONS
DO NOT READ THEM BEFORE TH WORKSHOP

###Specification
####Requirement 1
If I give you an empty string, I want your calculator to answer 0.

####Requirement 2
If I give you a single digit, I want your calculator to respond with that number.
For instance:
“0” should produce the value 0, and
“5” should produce the value 5.

####Requirement 3
If I give you two single digits separated by a comma, I want your calculator to respond with the sum of those numbers.
For instance:
“1,2” should produce the value 3, and
“7,9” should produce the value 16.

####Requirement 4
If I give you two strings of digits separated by a comma, I want your calculator to answer with the sum of those numbers.
For instance:
“12,45” should produce the value 57, and
“42,159” should produce the value 201.

####Requirement 5
If I give you any number of strings of digits separated by a comma, I want your calculator to answer with the sum of those numbers.
For instance:
“1558,2,2442” should produce the value 4002,
“15,22,45,79” should produce the value 161.

####Requirement 6
I forgot, sometimes I’ll give you a newline character instead of a comma. You should treat it the same as a comma.
For instance:
“1\n2,3” should produce the value 6.

####Requirement 7
On second thought, maybe we should make it so delimiters can be set in the input.
Whenever I give you two slashes followed by a character on the first line of the input, use that character as the delimiter.
“//;\n2;5” should produce the value 7.

####Requirement 8
Oh damn, I forgot about negative numbers. They’re a problem, so let’s just throw an exception when you see one in the input.

####Requirement 9
The exception message would be a good place to watch for problems, so let’s put a list of the negative values in there, but only when there are multiples.

####Requirement 10
Sometimes the input gets a little garbled, so let’s ignore any numbers larger than 1000.

####Requirement 11
Ok, we’re seeing some strange inputs recently. Can we make it so delimiters can be multiple characters long?
Let’s agree the first line will have square brackets around the delimiter like this: 
“//[delimiter string]”
