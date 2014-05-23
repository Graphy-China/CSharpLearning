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



  
class Document
 
  # A mixin. Add collection-related methods into class.
  # require: the including class has "each" iterator.
  include Enumerable 

  attr_reader :title, :author, :content

  def initialize(title, author, content)
    @title = title
    @author = author
    @content = content
  end

  def words
    @content.split
  end

  def word_count
    words.size
  end

   # control writable attribute.
  def title= (new_title)
    @title = new_title
  end

  def author= (new_author)
      @author = new_author
  end

  def content= (new_content)
    @content = new_content
  end

  # iterator for Document.
  # key iterator.
  def each
    word_array = words
    index = 0
    while index < word_array.size
      yield( word_array[index] ) # pass parameter to block.
      index+=1
    end
  end

  # version 1 take array's each method.
  def each_v1
    words.each { |word| yield(word) }
  end

  def each_character
    index = 0
    while index < @content.size
      yield( @content[index])
      index += 1
    end
  end

  # iterator that run through collections that don't actually exist.
  def each_word_pair
    word_array = words
    index = 0
    while index < word_array.size
      yield word_array[index], word_array[index+1]
      index += 1
    end
  end
 
  # version 1. Task advantage of Enumerable::each_con
  def each_word_pair_v1
    words.each_con(2) {|array| yield array[0],array[1]}
  end

end


# test for Document.each_word:
d = Document.new( 'Truh', 'Gaump', 'Life is like a box of ...')

d.each {|word| puts word }  # block as a parameter.
d.each_v1 {|word| puts word}
puts "------- each character ----------"
d.each_character {|c| puts c}


#=======================
# Iterating over Ethereal
#12.times { |x| puts "The number is #{x}" } #.
d.each_word_pair {|first, second| puts "#{first} and #{second}"}

# use Enumerator .
enum = Enumerator.new( doc, :each_character )
puts enum.count
