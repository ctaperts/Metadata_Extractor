# Metadata_Extractor
Extract metadata from text files

Helps find metadata, for example to from sent etc, in text files that were once an e-mail and other files

Two searches are setup
------
1 - General e-mail search. Includes - from:, sent:, to:, cc:, bcc:, subject:, date:, and attachments:. case-insensitive

2 - Custom search

Custom search has options for case sensitive or insensitive

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
