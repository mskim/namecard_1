
![card sample](output.jpg)
# Namecard User Guide

Namecard automates business card creation.

1. You need to have Ruby installed in your system.
    MacOS comes Ruby pre installed.
1. You need rjob.app to generate PDF. Currently rjob.app only runs on macOS > 10.10.
1. You need step_and_repeat.app for A3/A4 step and repeat PDF generation.

1. Move rjob.app and step_and_repeat.app to /Applications folder. rjob.app step_and_repeat.app are command line tools, not regular Mac applications, so double clicking the apps will not do anything. They are accessed from a terminal, rake or by other scripts.

1. prepare data.csv file for each member, using Excel or Numbers.
1. Save them as data.csv.
   Make sure the first column of data.csv is the name field.
   All business card files are generated using the first column field as the file name.
1. Edit layout.erb to change the design layout
	if you know what you are doing.
	Each member's design files are generated from this file.
1. Replace the logo(1.pdf or logo.pdf) file in images folder with your logo with same name.
1. Open the terminal.app
1. cd /your/namecard/folder and type following commands.

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

## rake order_print

#### Web Based Ordering
  rake order_print command opens web browser with pre-set url to customers page with company_id, member_id as parameter.
  In case of company user, it could take the member to the company page, where user enters his/her email to get to specific member page.

#### git based ordering
  print requests` are sent to printer when git is committed, with web-hook.
  Review price in price.pdf.  sample_order_form.yml is provided as a guide, make a copy and save as order-your_name-2017-2-24.yaml.
