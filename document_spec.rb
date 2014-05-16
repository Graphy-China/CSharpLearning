# RSpec
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
# install rspec: sudo gem install rspec
# run: rspec -I. document_spec.rb
#
# RSpec: http://rspec.info 
#

require 'document.rb'

describe Document do

  before :each do
    @text = 'A bunch of words'
    @doc  = Document.new('test', 'nobody', @text)
  end 

  it 'should hold on to the contents' do
    @doc.content.should == @text
  end

  it 'should known which words it has' do
    @doc.words.include?('A').should == true    # form 1
    @doc.words.should include( 'bunch' )       # form 2
    @doc.words.should include( 'of' )
    @doc.words.should include( 'words' )
  end

  it 'should know how many words it contains' do
    @doc.word_count.should == 4
  end

  after :each do
    a = 10 # TBD: dummy
  end


end

#
# A "stub" is an object that implements the same interface as one of
# the supporting cast members, but returns canned answers when its
# methods are called.
#
# A "mock" is a stub iwth an attitude. Along with knowing what canned
# responses to return, a mock also knows which methods should be called
# and with what arguments.
#

describe PrintableDocument do
  before :each do
    @text = 'A bunch of words'
    @doc  = PrintableDocument.new( 'test', 'nobody', @text )
  end

  it 'should know how to print itself' do
    # create printer stub.
    stub_printer = stub :available? => true, :render => nil
    @doc.print( stub_printer ).should == 'Done'
  end

  it 'should know how to print itself.(enhanced test)' do
    # create printer mock.
    mock_printer = mock('Printer')
    mock_printer.should_receive(:available?).and_return(true)
    mock_printer.should_receive(:render).exactly(3).times

    @doc.print( mock_printer ).should == 'Done'
  end

  
  it 'should return the proper string if printer is offline' do
    # create printer stub.
    stub_printer = stub :available? => false, :render => nil
    @doc.print( stub_printer ).should == 'Printer unavailable'
  end

end
