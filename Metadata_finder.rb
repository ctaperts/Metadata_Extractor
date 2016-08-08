system("clear")
puts " "
puts " "
puts "Text metadata extractor - by Colby Taperts colbytaperts@gmail.com"
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
puts "        =================================        "
puts "        =================================        "
puts "        ==============================x==        "
puts "        =================================        "
puts "        ====    =========================        "
puts "        ====  =  =========      =========        "
puts "        ====  ==  ===   ====  ===   =====        "
puts "        ====  ==  ==  =   ==  ==  =   ===        "
puts "        ====  ==  =        =  =        ==        "
puts "        ====  ==  =  ====  =  =  ====  ==        "
puts "        ====    ===  ====  =  =  ====  ==        "
puts "        =================================        "
puts " "
puts " "
puts "Look at all of the text documents before selecting a option below"
puts "Metadata_Extractor will search the current and any subfolder for files that end in txt"
puts " "
puts "What kind of search would you like? choose the corresponding option below"
#options
puts " "
puts " "
puts " "

puts "1 - General e-mail search. Includes - from:, sent:, to:, cc:, bcc:, subject:, date:, and attachments:. case-insensitive"
puts "2 - Custom search"
puts " "
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
  find_text = [['\A', 'From:', ''], ['\A', 'Sent:', ''], ['\A', 'To:', ''], ['\A', 'Cc:', ''], ['\A', 'Bcc:', ''], ['\A', 'Subject:', ''], ['\A', 'Date:', ''], ['\A', 'Attachments:', '']]
puts " "
puts " "

when "2"

puts " "
puts " "
  puts "Custom search"
puts " "
puts " "
puts " "
puts "######### Help #########"
puts "Enter the number of items you want to search for, this search will only show the first instance of that term"
puts " "
puts "######### Advanced Help #########"
puts "Go to http://www.tutorialspoint.com/ruby/ruby_regular_expressions.htm to find patterns to input."
puts "for example \\\A before your search term will show only lines that begin with that word ie \"\\\ASent:\""
puts " "
#puts "######### Pattern Help #########"
#puts "Use Regexp::IGNORECASE to ignore case"
puts " "
puts "Will this search be case sensitive? (y/n)"
puts " "
print "> "
puts " "
puts " "
var_sensitive = 0 
case gets.chomp
when "y"
  var_sensitive += 1
  puts "This search will be case sensitive"
else
  puts "This search will be case insensitive"
end
puts " "
puts " "

puts "How many words are you searching for?"
puts " "

print "> "
custom_input_num = gets.to_i
custom_input_num += 1
puts " "

##### array
find_text = Array.new
##### array

var_num = 1
#ignore case - Regexp::IGNORECASE
while var_num < custom_input_num
  print "Search term #{var_num}: "
  custom_word = gets.chomp
  #print "Search pattern: "
  #custom_pat = gets.chomp
  custom_pat = ''
  #print "Search modifier: "
  #custom_mod = gets.chomp
  custom_mod = ''
  find_text << [custom_pat, custom_word, custom_mod]
  var_num += 1
end

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
	    if var_sensitive == 1
	      if read_file.lines.grep(/#{word}/).size > 0
                meta_out << read_file.lines.grep(Regexp.new(/#{word}/)).first.chomp
	      else
                meta_out << ''
	      end
	    else
	      if read_file.lines.grep(/#{word}/i).size > 0
                meta_out << read_file.lines.grep(Regexp.new(/#{word}/i)).first.chomp
	      else
                meta_out << ''
	      end
	    end
        end
    end
end

class Syntax
  def self.out(input)
    #some syntax modding
    input = input.join('^^')
    input.gsub!(/\n/," ")
    input.gsub!(/(,)/, "")
    input.gsub!(/(\^\^)/, ",")
    input.gsub!('!newline',"\n")
    input.gsub!(/^(,)/, "")
  end
end


#output to csv
puts Syntax.out(meta_out)
open('myfile.csv', 'w') { |f|
  f.puts "#{Syntax.out(meta_out)}"
}
