# Namecard User Guide

Namecard automates business card creation.

1. You need to have Ruby installed in your system.
    MacOS comes Ruby pre installed.
1. You need rjob.app to generate PDF. Currently rjob.app only runs on macOS > 10.10.
1. Move rjob.app to /Applications folder. rjob.app is a command line tool, not regular Mac Application, so double clicking the app will not do anything. It is accessed from a terminal, rake or by other scripts.

1. prepare data.csv file for each member, using Excel or Numbers.
1. Save them as data.csv.
   Make sure the first column of data.csv is the name field.
   All business card files are generated using the first column field as the file name.
1. Edit layout.erb to change the design layout
	if you know what you are doing.
	Each member's design files are generated from this file.

1. Open the terminal.app
1. cd /your/namecard/folder

## rake layout
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

## rake step
  generate step and repeat for A3 size PDF
