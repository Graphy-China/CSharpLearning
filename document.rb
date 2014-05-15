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

class Document
 
  attr_accessor :writable, :read_only
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

  # Using ngram anaysis, compute the probability
  # that this document and the one passed in were
  # written by the same person. This algorithm is
  # known to be valid for American English and will
  # probably work for British and Canadian English.
  #
  def same_author_probability( other_document )
    # implement TBD
  end

  # control writable attribute.
  def title= (new_title)
#    if @writable
#      @title = new_title
#    end
#    -> better in one line
    @title = new_title if @writable
  end

  def author= (new_author)
    if not @read_only
      @author = new_author
    end
  end

  def content= (new_content)
    # unless: statement is executed only if the condition is false
#   unless @read_only
#     @content = new_content
#   end
#   ->better in one line.
    @content = new_content unless @read_only
  end
 
end
