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

# we will have a single Rendering module.
require "15.module_as_namespace_rendering.rb" 
require "15.module_as_namespace_rendering_backends.rb" 

# moudle is also an object.
the_module = Rendering
my_font = the_module.Font.new('Arial')



# usage of module:

