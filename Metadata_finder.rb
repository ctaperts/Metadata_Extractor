
puts "Text metadata extractor - by Colby Taperts colbytaperts@gmail.com\n"

puts "Look at all of the text documents before adding input"
puts "What kind of search would you like? choose the corresponding option below"
#options

puts "Add a word to search on and extract for example SENT:"
#custom search

txt_files = Dir["./**/*.txt"]

find_text = [['\A', 'FROM=', 'Regexp::IGNORECASE'], ['\A', 'SENT:', ''], ['\A', 'TO:', ''], ['\A', 'SUBJECT:', '']]

meta_out = []

txt_files.each do |file_name|
	if !File.directory? file_name
	meta_out << "\n"
		#puts file_name
		meta_out << "#{file_name.chomp}"
		find_text.each do |pat, word, mod|
			File.open(file_name) do |file|
				file.each_line do |line|
					if line =~ Regexp.new("#{pat}#{word}", "#{mod}")
						#puts "Found: #{line}"
						meta_out << "#{line.chomp}"	
					end
				end
			end
		end
		end
end
meta_out
meta_out_final = "" + meta_out.join("^^") + ""
meta_out_final.gsub! /(,)/, ""
meta_out_final.gsub! /(\^\^)/, ","
meta_out_final.gsub! /^(,)/, ""

puts meta_out_final
open('myfile.csv', 'w') { |f|
  f.puts "#{meta_out_final}"
}


#find1 = contents.lines.grep(/FROM/i).grep_v(/ from /)
#find2 = contents.lines.grep(/TO:/i).grep_v(/mailto/)
#find3 = contents.lines.grep(/CC:/i)
#find4 = contents.lines.grep(/SUBJECT:/i)
#find5 = contents.lines.grep(/DATE RECEIVED:/i)
#puts input_filename
#puts find1
#puts find2
#puts find3
#puts find4
#puts find5

#puts txt_files