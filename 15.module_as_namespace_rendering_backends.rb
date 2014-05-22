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
#  - moudle can across source files.
#  - moudle can be nested in other module.

module Rendering

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

