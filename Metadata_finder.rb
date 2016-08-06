#puts "Text metadata extractor - by Colby Taperts colbytaperts@gmail.com\n"
#
#puts "Look at all of the text documents before adding input"
#puts "What kind of search would you like? choose the corresponding option below"
#options

#puts "Add a word to search on and extract for example SENT:"
#custom search

txt_files = Dir["./**/*.txt"]

#find_text = {'FROM=' => ['\A', 'Regexp::IGNORECASE'], 'SENT:' => ['\A', ''], 'TO:' => ['\A', ''], 'SUJECT:' => ['\A', '']}
find_text = [['\A', 'FROM=', 'Regexp::IGNORECASE'], ['\A', 'SENT:', ''], ['\A', 'TO:', ''], ['\A', 'SUBJECT:', '']]

meta_out = []

meta_out << "Filename"	

find_text.each do |pat, word, mod|
	meta_out << word
end

puts " "

txt_files.each do |file_name|
    meta_out << "!newline"
    meta_out << file_name
    find_text.each do |pat, word, mod|
	if !File.directory? file_name
	    open_file = File.open("#{file_name}")
	    read_file = open_file.read
            if read_file.lines.grep(/#{word}/i).size > 0
                word_out_one = read_file.lines.grep(/#{word}/)
                #puts word_out_one
                meta_out << word_out_one
            else
                word_out_two =  word
                #puts word_out_two
                meta_out << word_out_two
            end
        end
    end
end

#some syntax modding
meta_out_final = meta_out.join('^^')
meta_out_final.gsub!(/\n/," ")
meta_out_final.gsub!(/(,)/, "")
meta_out_final.gsub!(/(\^\^)/, ",")
meta_out_final.gsub!('!newline',"\n")
meta_out_final.gsub!(/^(,)/, "")

#output to csv
puts meta_out_final
open('myfile.csv', 'w') { |f|
  f.puts "#{meta_out_final}"
}
