# Block as iterator 
#---------------------
# Author: Seangel.Yu
# Copyright 2014 Seangel.Yu
#
# Document: An example Ruby class
#

# 
#---------------------
# How to use:
#--------------------------
# 

#block with argument.

def do_something
  value = yield('Hello world') if block_given?
  puts "The block returned #{value}"
end

# call:
# format 1.
do_something do |message|
  puts "The message is #{message}"
  3.14159 / 4.0
end

# format 2.
do_something { |message| puts "The message is #{message}";  3.15/2.0}
  

