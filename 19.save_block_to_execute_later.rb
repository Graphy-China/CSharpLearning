# 19. using blocks to transport your code through time.
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

# 1. block passed in as implicit parameter.

def do_something
  value = yield('Hello world') if block_given?
  puts "The block returned #{value}"
end

do_something do |message|
  puts "The message is #{message}"
  3.1415926 / 2.0
end

# 2. block as explicit parameter
#    explicit code block parameter can be stored and executed later.
def run_that_block( &that_block )
  puts "About to run the block"
  that_block.call("hello world")   # call that block
  puts "Done running the block"
end

run_that_block do |message|
  puts "The message is #{message}"
  3.1415926 / 2.0
end

# 3. explicit code block parameter uned in call back.

class DocumentSaveListener
  def on_save( doc, path)
    puts "Hey, I've been saved!"
  end
end

class DocumentLoadListener
  def on_load( doc, path)
    puts "Hey, I've been loaded!"
  end
end


# call back with traditional listener class
class Document_v0
  attr_accessor :loaad_listener
  attr_accessor :save_listener

  attr_reader :author, :title, :content

  def initialize( author, title, content )
    @author = author
    @title  = title
    @content = content
    @load_listener = DocumentLoadListener.new
    @save_listener = DocumentSaveListener.new
  end

  def test( message )
    puts '--------test #{message}----------'
  end

  def load( path )
    @content = File.read( path )
    @load_listener.on_load( self, path) if @load_listener
  end

  def save( path )
    File.open( path, 'w') {|f| f.print( @content) }
    @save_listener.on_save( self, path) if @save_listener
  end
end

puts "----------------------- document v0 ----------"
doc_v0 = Document_v0.new('syu', 'Book Ruby', "I love this game")
puts doc_v0.content
doc_v0.test('my message')

doc_v0.load('test.ps')
puts doc_v0.content
doc_v0.save('test.ps')


# call back with explicit code block parameters. 
class Document_v1
  attr_reader :laod_listener, :save_listener
  attr_reader :author, :title, :content

  def initialize( author, title, content )
    @author = author
    @title  = title
    @content = content
  end

  def test( message )
    puts '--------test #{message}----------'
  end

  def on_save( &block )
    @save_listener = block
  end

  def on_load( &block )
    @load_listener
  end
    
  def load( path )
    @content = File.read( path )
    @load_listener.call( self, path) if @load_listener
  end

  def save( path )
    File.open( path, 'w') {|f| f.print( @content) }
    @save_listener.call( self, path) if @save_listener
  end
end

puts "----------------------- document v1 ----------"
doc_v1 = Document_v1.new('syu', 'Book Ruby', "I love this game")

doc_v1.on_load do |doc|
  puts "Hey, I've been loaded!"
end

doc_v1.on_save do |doc|
    puts "Hey, I've been saved"
end

puts doc_v1.content
doc_v1.test('my message')

doc_v1.load('test.ps')
puts doc_v1.content
doc_v1.save('test.ps')

# 4. block used in lazy initialization.

class BlockBasedArchivalDocument
  attr_reader :title, :author

  def initialize(title, author, &block)
    @title  = title
    @author = author
    @initializer_block = block
  end

  def content
    if @initializer_block
      @content = @initializer_block.call
      @initializer_block = nil
    end
    @content
  end

end

puts "--------------- block lazy initialization ------------"
file_doc = BlockBasedArchivalDocument.new('file','russ') do
  File.read( 'test.ps' )
end
puts file_doc.content

require 'net/http'
google_doc = BlockBasedArchivalDocument.new('silly', 'russ') do
  Net::HTTP.get_response('www.google.com', '/index.html').body
end
puts google_doc.content


#5. Instant block objects with "lambda"
class Document_v2
  DEFAULT_LOAD_LISTENER = lambda do |doc, path|
    puts "loaded: #{path}"
  end

  DEFAULT_SAVE_LISTENER = lambda do |doc, path|
    puts "saved: #{path}"
  end

  
  #attr_reader :laod_listener, :save_listener

  attr_reader :author, :title, :content

  def initialize( author, title, content )
    @author = author
    @title  = title
    @content = content
    @save_listener = DEFAULT_SAVE_LISTENER
    @load_listener = DEFAULT_LOAD_LISTENER
  end

  def content= (new_content)
    @content = new_content
  end

  def test( message )
    puts '--------test #{message}----------'
  end

  def on_save( &block )
    @save_listener = block
  end

  def on_load( &block )
    @load_listener
  end
    
  def load( path )
    @content = File.read( path )
    @load_listener.call( self, path) if @load_listener
  end

  def save( path )
    File.open( path, 'w') {|f| f.print( @content) }
    @save_listener.call( self, path) if @save_listener
  end
end

puts "----------------------- document v2 ----------"
doc_v2 = Document_v2.new('syu', 'Book Ruby', "I love this game")


puts doc_v2.content
doc_v2.test('my message')

doc_v2.load('test.ps')
puts doc_v2.content
doc_v2.save('test.ps')

puts "===with user provided call back==="
doc_v2.on_load do |doc|
  puts "Hey, I've been loaded!"
end

doc_v2.on_save do |doc|
    puts "Hey, I've been saved"
end

doc_v2.content = "My data"
puts doc_v2.content
doc_v2.test('my message')

doc_v2.load('test.ps')
puts doc_v2.content
doc_v2.save('test.ps')
