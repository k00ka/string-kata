String Calculator Kata TDD Workshop
===================================

This repo contains an exercise for our third workshop presented by me, David Andrews. This workshop is about TDD. For this session we have based our activities on Roy Osherove's String Calculator kata.

We've restructured the repository to provide a quick-start to TDD with RSpec and to mimic the setup we used last time. The code to be created is found in the ``lib/`` directory, and we have supplied unit tests in the ``spec/`` directory.

###Setup

Here are the steps to get you started with the repo. We assume, naturally, that you have a working development machine with Ruby 1.9 or better on it. At Ryatta Group we use rbenv, and so we've included some optional elements - just skip them if you're using rvm or are not versioning your Ruby.

Best prectice would have you "fork" this repo in GitHub (first) and then perform the following steps. If you don't fork the repo, use ``git@github.com:k00ka/string-kata.git`` as the repo address.
```sh
% git clone <repo-address>
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

###TDD
If you want to learn (more) about TDD, there are plenty of online resources. For a quick primer, you can review our blog post from the previous workshop: [http://www.ryatta.com/refactoring-in-context/]

Tonight (or below if you're doing this kata on your own), I’m going to give you some directions for what your solution should do. In response to these requests, you are going to:

1. Focus on one specification at a time. Do not read ahead.
1. Implement the test(s) in spec/string_calculator_spec.rb.
1. Run "rspec" from the project root and watch the new test(s) fail.
1. Implement the simplest possible change to lib/string_calculator.rb to make the code work. Don't refactor.
1. Check that the tests pass.
1. Commit your new code.
1. Refactor the code with the focus on simplifying it (refactor but try not to change the scope of functionality).
1. Check that the tests still pass.
1. Commit your revision.
1. Start again with a new requirement.

We'll iterate on this pattern about 11 times so you can practice the TDD workflow.

####Tips
* Implement the simplest code you can imagine to make the tests pass.
* Once the tests pass, refactor the code to simplify it.
* Let earlier tests stand, they will catch regressions.
* Discuss edge cases and obscure aspects with the customer or others on your team.

###How to test

There is an empty file (well, almost empty) in the ``lib/`` directory. It is called ``string_calculator.rb``. This is part 1 of your deliverable.

There is a unit test file in the ``spec/`` directory called ``string_calculator_spec.rb``. This is part 2 of your deliverable.

To "pass the String Kata", you need to make both files work together.
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
```

The text ``1 failure`` means you're currently "failing the String Kata"! Now go fix some code and share what you've learned with the group.

###The Exercise
Carefully follow the TDD workflow described above. The focus should be on learning the workflow, not how clever you can be with the code. Try not to write generalized solutions, but focus on the simplest, minimal code for each requirement. Most people can see that a split followed by calling to_i and summing the values is the end goali here. The point is to focus on minimalism, not on projecting general solutions.

####Requirement 1
If I give you an empty string, I want your calculator to answer 0.

####Requirement 2
If I give you “0” I want your calculator to produce the value 0, and a “5” should produce the value 5.

####Requirement 3
If I give you “1,2”, it should produce the value 3, and “7,9” should produce the value 16.

####Requirement 4
If I give you two strings of digits separated by a comma, I want your calculator to answer with the sum of those numbers.  Some good test cases are “12,45” should produce the value 57, and “42,159” should produce the value 201.

####Requirement 5
If I give you any number of strings of digits separated by commas, I want your calculator to answer with the sum of those numbers. Some good test cases are “1558,2,2442” should produce the value 4002, “15,22,45,79” should produce the value 161, and "2" should produce the value 2.

####Requirement 6
I forgot, sometimes I’ll give you a newline character instead of a comma. You should treat it the same as a comma.  For instance “1\n2,3” should produce the value 6. (Why might your solution produce the value 4?)

####Requirement 7
On second thought, maybe we should make it so delimiters can be set in the input.  Whenever I give you two slashes followed by a character on the first line of the input, use that character as the delimiter. For instance, “//;\n2;5” should produce the value 7. (Why might your solution produce the value 2?)

####Requirement 8
Oh damn, I forgot about negative numbers. They’re a problem, so let’s just throw an exception when you see one in the input. Note the use of "raise" and the the RSpec "raise_error" matcher for this step. Look them up and learn them. From this point on, I'm leaving it to you to consider and decide upon appropriate test cases.

####Requirement 9
The exception message would be a good place to watch for problems, so let’s put a list of the negative values in there, but only when there are multiple negatives in the string.

####Requirement 10
Sometimes the input gets a little garbled, so let’s ignore any numbers larger than 1000.

####Requirement 11
Ok, we’re seeing some strange inputs recently. Can we make it so delimiters can be multiple characters long?
Let’s agree the first line will have square brackets around the delimiter like this: 
“//[delimiter string]”

####Requirement 12
Celebrate.


###Final Notes

DHH has come out to say that he doesn't follow TDD [http://david.heinemeierhansson.com/2014/tdd-is-dead-long-live-testing.html]. His main concerns were with regard to the unintended impacts on system design that TDD were creating. His preferred approach is to focus on System Testing. Stay tuned to the Ryatta blog for an imformative post about this very topic (how timely!) The blog entry will be posted here when it's ready: [http://www.ryatta.com/category/development/]
