require 'pry'

txt_files = Dir["./**/*.txt"]

#find_text = {'FROM=' => ['\A', 'Regexp::IGNORECASE'], 'SENT:' => ['\A', ''], 'TO:' => ['\A', ''], 'SUJECT:' => ['\A', '']}
find_text = [['\A', 'FROM=', 'Regexp::IGNORECASE'], ['\A', 'SENT:', ''], ['\A', 'TO:', ''], ['\A', 'SUBJECT:', '']]

meta_out = []

meta_out << "^^"	

find_text.each do |pat, word, mod|
	meta_out << word
end

puts " "

#puts txt_files

txt_files.each do |txt_file|
 meta_out << txt_file
 f = File.open(txt_file)
  f.each_line do |line|
    meta_out << line
  end
  f.close
end

binding.pry

puts meta_out.join

