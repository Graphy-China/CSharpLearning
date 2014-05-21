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
# 1. class variables : vertical global variables.
#    where does class variables stored?
#    
#    1) find @@default_papper_size in current class. If found, finish. Else go to step2.
#    2) find @@default_papper_size in inheritance tree of current class. if found, finish. 
#       Else, go to step3.
#    3) create a new class variable.
#

class Document
  # @@default_font = :arial     #!! This will shadow subclass's @@default_font.

  @@default_papper_size = :a4   # class variables
  
  def self.default_papper_size  # class method
    @@default_papper_size
  end

  def self.default_papper_size= ( new_size )  # class method
    @@default_papper_size = new_size
  end


  # instance variables.
  attr_accessor :author, :title, :content
  attr_accessor :paper_size

  def initialize( title, author, content)
    @author  = author
    @title   = title
    @content = content
    @paper_size = @@default_paper_size  # set instance variable as class level data.

  end

end


class Resume < Document

  @@default_font = :arial   # class variables
  
  def self.default_font  # class method
    @@default_font
  end

  def self.default_font= ( new_font )  # class method
    @@default_font = new_font
  end


  # instance variables.
  attr_accessor :font

  def initialize( title, author, content, font)
    super(title, author, content)
    @font = @@default_font
  end

end

class Presentation < Document

  @@default_font = :nimbus   # class variables
  
  def self.default_font  # class method
    @@default_font
  end

  def self.default_font= ( new_font )  # class method
    @@default_font = new_font
  end


  # instance variables.
  attr_accessor :font

  def initialize( title, author, content, font)
    super(title, author, content)
    @font = @@default_font
  end

end

