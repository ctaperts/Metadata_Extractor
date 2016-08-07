







system("clear")
puts " "
puts " "
puts " "
puts " "
puts " "
puts " "
puts "Text metadata extractor - by Colby Taperts colbytaperts@gmail.com\n"
puts " "
puts " "
puts " "
puts " "
#
puts "        =================================        "
puts "        =================================        "
puts "        =====   =   =======      ========        "
puts "        ====  =  =  =    ====  ===   ====        "
puts "        ====  =  =  =  ======  ==  =   ==        "
puts "        ====  =  =  =    ====  =        =        "
puts "        ====  =  =  =  ======  =  ====  =        "
puts "        ====  =  =  =    ====  =  ====  =        "
puts "        =================================        "
puts " "
puts " "
puts " "
puts "Look at all of the text documents before selecting options below"
puts "What kind of search would you like? choose the corresponding option below"
#options
puts " "
puts " "
puts " "

puts "1 - General e-mail search including from:, sent:, to:, cc:, bcc:, subject:, date:, and attachments:"
puts "2 - custom search"
puts " "
puts " "
puts "Custom search is not working yet"
puts " "
print "> "
input_get = gets.chomp
puts input_get
system("clear")
case input_get
when "1"
puts " "
puts " "
  puts "Using from:, sent:, to:, cc:, bcc:, subject:, date:, and attachments: in search"
  find_text = [['\A', 'FROM:', ''], ['\A', 'SENT:', ''], ['\A', 'TO:', ''], ['\A', 'CC:', ''], ['\A', 'BCC:', ''], ['\A', 'SUBJECT:', ''], ['\A', 'DATE:', ''], ['\A', 'ATTACHMENTS:', '']]
puts " "
puts " "
when "2"
puts " "
puts " "
  puts "Custom search"
puts " "
puts " "
else 
  abort("She cannot take any more of this, Captain!")
end


#puts "Add a word to search on and extract for example SENT:"
#custom search




# Older arrays used for references
#find_text = {'FROM=' => ['\A', 'Regexp::IGNORECASE'], 'SENT:' => ['\A', ''], 'TO:' => ['\A', ''], 'SUJECT:' => ['\A', '']}
#find_text = [['\A', 'FROM=', 'Regexp::IGNORECASE'], ['\A', 'SENT:', ''], ['\A', 'TO:', ''], ['\A', 'SUBJECT:', '']]
#find_text = [['\A', 'FROM:', ''], ['\A', 'SENT:', ''], ['\A', 'TO:', ''], ['\A', 'CC:', ''], ['\A', 'BCC:', ''], ['\A', 'SUBJECT:', ''], ['\A', 'DATE:', ''], ['\A', 'ATTACHMENTS:', '']]

meta_out = []

meta_out << "Filename"	

find_text.each do |pat, word, mod|
	meta_out << word
end

txt_files = Dir["./**/*.txt"]

txt_files.each do |file_name|
    meta_out << "!newline"
    meta_out << file_name
    find_text.each do |pat, word, mod|
	if !File.directory? file_name
	    read_file = File.read("#{file_name}")
            if read_file.lines.grep(/#{word}/i).size > 0
                word_out_one = read_file.lines.grep(/#{word}/)
                meta_out << word_out_one
            else
                meta_out << ' '
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
