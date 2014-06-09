
Dir.chdir('./test')

Dir.foreach('.') do |fname|
  case fname
  when /\d\d\d/
    puts "3 digit: #{fname}"
  when /\d\d/
    newname = '0'+fname;
    File.rename(fname, newname);
    puts "2 digit: #{fname} -> #{newname}"
  when /\d/
    newname = '00'+fname;
    File.rename(fname, newname);
    puts "1 digit: #{fname} -> #{newname}"
  else
    puts "others: #{fname}"
  end

end

Dir.chdir('..')

puts '=================================='
