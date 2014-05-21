# class level variables
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


#
# class instance variables: more controlable than class variable.
#   
# 

class Document
  @default_font = :arial          # same as instance variable.

  def self.default_font=( font )  # class method.
    @default_font = font          # always set an instance variable on itself.
                                  # this will assign variable to class instance.
  end

  def self.default_font  #class method.
    @default_font
  end

  attr_accessor :author, :title, :content
  attr_accessor :font

  def initialize( author, title, content)
    @author = author
    @title  = title
    @content = content
    @font   = Document.default_font
  end

end

class Presentation < Document
  @default_font = :nimbes         # same as instance variable.

  class << self
    attr_accessor :defailt_font  # define a class instance variable and with get/set.
  end

  def initialize(author, title, content)
    @title = title
    @author = author
    @content = content
    @font = Presentation.default_font
  end

end
