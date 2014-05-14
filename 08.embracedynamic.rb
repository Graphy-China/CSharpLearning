# Explain background
#---------------------
# Author: Seangel.Yu
# Copyright 2014 Seangel.Yu
#
# Document: An example Ruby class
#

# Quick explanation of what the class does:
#---------------------
#
#


# How to use: a few examples
#--------------------------
# Class that models a plain text document, complete with title
# and author:
#
# doc = Document.new( 'Hamlet', 'Shalspare', 'To be or that!')
# puts doc.title
# puts doc.author
# puts doc.content
#
# Document instances know how to parse their content into words:
# 
# puts doc.words
# puts doc.word_count
#

# abstract class serve as the base for both regular and lazy flavors
# of documents
class BaseDocument

  def title
    raise "Not Implemented"
  end

  def title=
    raise "Not implemented"
  end

  def author
    raise "Not Implemented"
  end

  def author=
    raise "Not Implemented"
  end

  def content
    raise "Not Implemented"
  end

  def content=
    raise "Not Implemented"
  end

  def words
    raise "Not Implemented"
  end

  def word_count
    raise "Not Implemented"
  end

end

class Document < BaseDocument
  attr_accessor :title, :author, :content

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

end

class LazyDocument < BaseDocument
  attr_writer :title, :author, :content

  def initialize(path)
    @path = path
    @document_read = false
  end

  def read_document
    return if @document_read
    File.open( @path) do | f |
      @title = f.readline.chomp
      @author = f.readline.chomp
      @contnet = f.read
    end
    @document_red = true
  end

  def title
    read_document
    @title
  end

  def title= ( new_title )
    read_document
    @title = new_title
  end


  def words
    @content.split
  end

  def word_count
    words.size
  end

  # and so on...

end

=begin
 BaseDocument only exists as a misguided effort to provide a common 
 interface for the various flavors of documents. The efforts is
 misguided because Ruby does not judge an object by its class
 hierarchy.
 Ruby simply assumes that if an object has the right methods, then
 it is the right kind of object (called duck typing).

 Therefore, we can complemently dispense with the BaseDocument and 
 redo the two document classes completely independent.

 Both classes support the same set of methods.
=end

class Title
  attr_reader :long_name, :short_name
  attr_reader :isbn

  def initialize (long_name, short_name, isbn)
    @long_name = long_name
    @short_name = short_name
    @isbn = isbn
  end
end

class Author
  attr_reader :first__name, :last_name

  def initialize (first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end
end
