# Singoleton && class level method
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
#  Singleton method:( instance.method_name)
#


#-----------------------------------
# singleton method

# Format 1
hand_built_stub_printer = Object.new 

def hand_built_stub_printer.available?
  true
end

def hand_built_stub_printer.render( content )
  nil
end 

# Format 2
class << hand_built_stub_printer
  def singleton_method3
    true
  end

  def signleton_method4
    false
  end
  
  # any more single methods.

end

#-----------------------------------
# class method: singletons in plain sight
#

class Document

  def initialize
  end

  # define class method.
  class << self
    def find_by_name( name)  # class method
    end
    
    def find_by_id  ( id )   # class method
    end
  end

end

# Add a class method : format 2.
def Document.explain
  puts " xxxxx yyyyy"
end

# usage:
Document.explain


