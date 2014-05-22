# use module as name space.
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
# use module to orginaze class constants and moudles.
#  - modules can contains methods constants classes, and even other modules
#  - usage of module.
#      1) module_name::element_name
#      2) include module_name
#         class_name. module_name constant_name
#      3) module level method:
#         a) module_name.method_name
#         b) module_name::method_name
#

module Rendering

# 1. module can hold classes.
  class Font
    attr_accessor :name, :weight, :size

    def initialize( name, weight=:normal, size=10)
      @name = name
      @weight = weight
      @size = size
    end

  end

  class PaperSize
    attr_accessor :name, :width, :height
    
    def initialize( name, width, height )
      @name = name
      @width = width
      @height = height
    end
  end

#2. module can hold constants.
DEFAULT_FONT = Font.new("default")
DEFAULT_PAPER_SIZE = PaperSize.new( :a4, 8.5, 11) # letter.

#3. module can hold methods. (A home for utilities)
#   use class alike method to define module method.
  def self.point2_to_inches( points )  
    points/72.0
  end

  def self.inches_to_points( inches )
    inches * 72.0
  end

#4. module can be nested
  module Backends
    class PDFBackend
      # ....
    end

    class PNGBackend
      # ...
    end
    
    class XPSBackend
      # ...
    end

  end # module backends


end # moudle rendering.


# usage of module:

