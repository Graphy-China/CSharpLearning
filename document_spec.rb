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
