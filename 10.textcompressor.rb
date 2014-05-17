# 10.textcompressor.rb 
#---------------------
# Author: Seangel.Yu
# Copyright 2014 Seangel.Yu
#
# Document: An example Ruby class
#

# Quick explanation of what the class does:
#---------------------
# Taking some text apart and compressing it into the 
# two arrays based on indexed algorithm.
#


# How to use:
#--------------------------
# 
# 

# version 1
# shortcommings : 
# the code itself doesn't do a very good job of speaking
# to the humans who need to maintain it.
#
class TextCompressor_v1
  attr_reader :unique, :index

  def initialize( text )
    @unique = []
    @index  = []
    
    words = text.split
    words.each do |word|
      i = @unique.index( word )
      if i
        @index << i
      else
        @unique << word
        @index  << unique.size - 1
      end
  end

end

# version 2
# pros: the names of the new methods give us a clue to what's going on
#       in the "initialize" method
#
# cons: initialize acts like a "don't bother me with the details" bosy
#       by delegating work to unique_index_of and add_unique_word, but
#       the it turns around and gets involved in the dirty details of 
#       managing the @index array.
# 
class TextCompressor_v2
  attr_reader :unique, :index

  def initialize( text )
    @unique = []
    @index  = []
    
    words = text.split
    words.each do |word|
      i = unique_index_of( word )
      if i
        @index << i
      else
        @index << add_unique_word( word )
      end
  end
  
  def unique_index_of( word )
    @unique.index(word)
  end
  
  def add_unique_word( word)
    @unique << word
    unique.size - 1
  end

end


# version 3
# Composing Mehods: 
# 

class TextCompressor_v3
  attr_reader :unique, :index

  def initialize( text )
    @unique = []
    @index  = []
    
    add_text( text)
  end

  def add_text( text )
    words = text.split
    words.each {|word| add_word( word )}
  end

  def add_word( word )
    i = unique_index_of(word) || add_unique_word( word )
    @index << i
  end
  
  def unique_index_of( word )
    @unique.index(word)
  end
  
  def add_unique_word( word)
    @unique << word
    unique.size - 1
  end

end
