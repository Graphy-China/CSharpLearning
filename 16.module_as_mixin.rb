# use module as mixins
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
# insert(mix in) modules into class's inheritance tree.
# - Mixins allow you to easily share common code among otherwise unrelated classes.
# - Case: In practice, this means that if you have several unrelated classes that need to share some code, 
#
# 

#mixin module
module WritingQuality
  CLICHES = [ /play fast and loose/,
              /make no mistake/,
              /does the trick/,
              /off and running/,
              /my way or the highway/ ]

  # Ordinary instance method. not a module level method.
  def number_of_cliches
    CLICHES.inject(0) do |count, phrase|
      count += 1 if phrase =~ content
      count
    end
  end


#3. module can hold methods. (A home for utilities)
#   use class alike method to define module method.
  def self.point2_to_inches( points )  
    points/72.0
  end

  def self.inches_to_points( inches )
    inches * 72.0
  end

end  


class Document
  include WritingQuality  #Mixin: the module's instance method is available to the class.

  class << self
    include WritingQuality  # all module level method become class level methods.
  end

end

class ElectronicBook
  include WritingQuality #Mixin: the module's instance method is available to the class.
  extend WrittingQuaity  # all module level method become class level methods.
end



