# Namecard User Guide

Namecard automates business card creation.

1. You need to have Ruby installed in your system.
    MacOS comes pre installed.
1. You need rjob.app to generate PDF.
1. Move rjob.app to /Applications folder
1. prepare data.csv file for each member, using Excel or Numbers.
1. Save them as data.csv.
1. Make sure the first column is the name field.
   All business card files are generated using the first column field as the file name.
1. Edit layout.erb to change the design layout
	if you know what you are doing.
	Each member's design files are generated from this file.

1. Open the terminal.app
	1. cd /your/namecard/folder
	1. rake layout
    - generates design file for each member in out folder.
  1. rake					
    - generate pdf business card. It only updates changed cards. So, if nothing happens, it means all card are upto date.
	1. rake step
    - generate step and repeat

## rake generate_layout
	generates layout.rb from layout.erb using data form data.csv
	use this when layout is changed in layout.erb

## rake
	generates PDF from layout.rb
	only newly updated files are processed
	so, if everything is upto date, nothing will happen.

## rake font_list
	list fonts that are installed in the system.
	It lists names of PostScript font name.
	Use this if you need to change the fonts that are used in the layout.erb
