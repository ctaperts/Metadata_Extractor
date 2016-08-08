# Metadata_Extractor
Extract metadata from text files

Helps find metadata, for example to from sent etc, in text files that were once an e-mail and other files

Two searches are setup
------
1 - General e-mail search. Includes - from:, sent:, to:, cc:, bcc:, subject:, date:, and attachments:. case-insensitive

2 - Custom search

Custom search has options for case sensitive or insensitive

#### Ruby regular expressions for advances searches

Go here for great tutorials on ruby regular expression to insert into custom search terms [http://www.tutorialspoint.com/ruby/ruby_regular_expressions.htm](http://www.tutorialspoint.com/ruby/ruby_regular_expressions.htm "Link to cheat sheet on ruby regexp") 

This is the offical documentation on regular expressions from ruby-docs.org [http://ruby-doc.org/core-2.1.1/Regexp.html](http://ruby-doc.org/core-2.1.1/Regexp.html)

Notes
-----
* Classes are not setup so if you type in wrong input it will continue but function incorrectly

#### Future Versions

* Additional preset searches 
* Advanced presets
  * Ignore whitespace
  * Treat a newline as a character matched by .
  * Perform #{} interpolation only once
* E-mail threading
* Find text not aligned with e-mail header
