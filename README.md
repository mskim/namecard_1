# NameCard User Guide

NameCard automates business card creation.

1. Move rjob.app to /Applications folder
1. prepare data.csv file for each member, using Excel or Numbers.
1. Save them as data.csv.
1. Make sure the first column is the name field.
   All business card files are generated using the first column field as the file name.
1. Edit layout.erb to change the design layout
	if you know what you are doing.
	Each member's design files are generated from this file.
	
1. Open the terminal.app 
	$ cd /your/namecard/folder
	$ rake generate_layout	#generate design file for each member
	$ rake					#generate pdf business card
	$ rake s_n_r			#generate step and repeat
	
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