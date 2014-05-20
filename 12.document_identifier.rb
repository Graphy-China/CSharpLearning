# Euqality
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
#  1. equal? : x.equal?(y)  true  if x and y refer to same object.
#                           false if x and y refer to different object.
#  
#  2. == 
#
#

class DocumentIdentifier
  attr_reader :folder,  :name

  def initialize( folder, name )
    @folder = folder
    @name   = name
  end

end
