# 18. execute around with a block
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

#block with argument.

class SomeApplication
  def initialize ( logger )
    @logger = logger
  end

  def do_something
    begin
      @logger.debug( 'Starting Document load' )
      @doc = Document.load( 'resume.txt')
      @logger.debug( 'Comleted Document load' )
    rescue
      @logger.error( 'Load failed!' )
      raise
    end

    begin
      @logger.debug( 'Starting Document save' )
      @doc.save
      @logger.debug( 'Comleted Document save' )
    rescue
      @logger.error( 'Save failed!' )
      raise
    end


end

# Execute around:
#  use a code block to interleave some standard bit of processing with whatever
#  it is that the block does. 
#
# passing anything block to method.
class SomeApplication_V1
  def initialize ( logger )
    @logger = logger
  end

  def do_something
    with_logging('load') { @doc = Document.load( 'resume.txt' )}

    # do something with doc.
    
    with_logging('save') { @doc.save }

  end

  def with_logging( description )
    begin 
      @logger.debug( "Starting #{description}")
      yield
      @logger.debug( "Completed #{description}")
    rescue
      @logger.error( '#{description} failed!' )
      raise
    end
  end


end

#
# Setting Up objects with an Initialization block

class Document
  attr_accessor  :title, :author, :content

  def initialize(title, author, content = '')
    @title = title
    @author = author
    @content = content
    
    yield( self ) if block_given?   # user inserted initialize block
  end

end

new_doc = Document.new( 'US Constitution', 'Madison', '' ) do |d|
  d.content << "We the people"
  d.content << "In order to form a more perfect union"
  d.content << "provide for the common defense"
end



