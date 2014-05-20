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
#             can not be overrided.
#  2. ==     : can be overrided. default behavior is same ass equal?. Defined in Object.
#
#

#------------------------
# 1. instance_of?  :Class
# 2. kind_of?      :Class Subclass
# 3. respond_to?   :method.
#------------------------

class DocumentIdentifier
  attr_reader :folder,  :name

  def initialize( folder, name )
    @folder = folder
    @name   = name
  end

  def ==( other )
    # Object compare: quick compare.
    return true  if other.equal?(self)
    # version 1. instance_of?  The "other" must be DocumentIdentifier.
    #            No subclass allowed.
    #return false unless other.instance_of?(self.class)

    # version 2. kind_of? The "other" can be DocumentIdentifier
    #            or its subclass.
    return false unless other.kind_of?(self.class)

    # note: here we does not use @folder and @name
    #       because attr_reader declare.

    folder == other.folder && name == other.name  
  end

end

class DocumentPointer
  attr_reader  :folder, :name

  def initialize( folder, name )
    @folder = folder
    @name   = name
  end  

  def ==( other )
    return false unless other.respond_to?(:folder)
    return false unless other.respond_to?(:name)
    
    folder == other.folder && name == other.name
  end


end
