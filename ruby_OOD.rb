



class Document
 
  attr_reader :title, :author, :content

  def initialize(title, author, content)
    @title = title
    @author = author
    @content = content
  end

  def words
    @content.split
  end

  def word_count
    words.size
  end

=begin
  # control writable attribute.
  def title= (new_title)
    @title = new_title
  end

  def author= (new_author)
    @author = new_author
  end
=end
  def content= (new_content)
    @content = new_content
  end
 
end


doc = Document.new( 'Ruby OOD', 'Syu', 'My tinny book for ruby')

puts doc.content
doc.content = 'Changed tinny book for ruby'
puts doc.content

