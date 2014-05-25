# 20. using hooks to keep your program informed.
#---------------------
# Author: Seangel.Yu
# Copyright 2014 Seangel.Yu
#
# Document: An example Ruby class
#

# hook is some way - sometimes by supplying a block and sometimes by just overriding a method -
# to specify the code to be executed when something specific happend.

# 
#---------------------
# How to use:
#--------------------------
# 

#1. Telling you when a class gains a subclass.

class SimpleBaseClass
  def self.inherited( new_subclass )  # class level method.
    puts "Hey, #{new_subclass} is now a subclass of #{self}!"
  end
end

class ChildClassOne < SimpleBaseClass
end

#2. use case
require 'document_simple.rb'

class DocumentReader

  # hook to 
  def self.inherited(subclass)
    DocumentReader.reader_classes << subclass
    puts " add reader class: #{subclass}"
  end

  class << self
    attr_reader :reader_classes
  end
  
  @reader_classes = []

  def self.read( path )
    reader = reader_for(path)
    return nil unless reader
    reader.read(path)
  end

  def self.reader_for(path)
    reader_class = DOcumentReader.reader_classes.find do |klass|
      klass.can_read?(path)
    end
    return reader_class.new(path) if reader_class
    nil
  end

end


class PlainTextReader < DocumentReader
  def self.can_read?(path)
    /.*\.txt/ =~ path
  end

  def initialize(path)
    @path = path
  end

  def read(path)
    File.open(path) do |f|
      title  = f.readline.chomp
      author = f.readline.chomp
      content = f.read.chomp

      Document.new( title, author, content)
    end
  end

end


class YAMLReader < DocumentReader
  def self.can_read?(path)
    /.*\.yaml/ =~ path
  end

  def initialize(path)
    @path = path
  end

  def read(path)
    # lots of simple YAML stuff omitted.
  end

end

class XMLReader < DocumentReader
  def self.can_read?(path)
    /.*\.xml/ =~ path
  end

  def initialize(path)
    @path = path
  end

  def read(path)
    # lots of simple XML stuff omitted.
  end

end


