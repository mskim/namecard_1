# encoding: UTF-8

require 'csv'
require 'erb'

directory "output"

task :default => :pdf
source_files = FileList["output/*.rb"]

task :font_list do
  system("/Applications/rjob.app/Contents/MacOS/rjob font_list")
end

task :pdf => source_files.ext(".pdf")
rule ".pdf" => ".rb" do |t|
  # script = File.open(t.source){|f| f.read}
  # system(" echo '#{script}' | /Applications/rjob.app/Contents/MacOS/rjob")
  system("/Applications/rjob.app/Contents/MacOS/rjob #{t.source}")
end

task :step do 
  pdf_files = source_files.ext(".pdf")
  pdf_files.each do |pdf|
    system("/Applications/step_n_repeat.app/Contents/MacOS/step_n_repeat #{pdf}")
  end
end
      
task :layout do
  csv_path = FileList["*.csv"].first
  template_path = FileList["layout.erb"].first
  unless File.exist?(template_path)
    puts "no layout.erb found!!!"
  else
	  template_file = File.open(template_path, 'r'){|f| f.read}
	  csv   		= File.open(csv_path, 'r'){|f| f.read}
	  rows  		= CSV.parse(csv)
	  keys  		= rows.shift
	  folder    = File.dirname(__FILE__)
	  output_folder  = File.dirname(__FILE__) + "/output"	  
    rows.each do |row|
	    row.each_with_index do |value, i|
	      instance_eval("@#{keys[i]}='#{value}'")
      end
	    erb = ERB.new(template_file)
	    @output_path = output_folder + "/#{@name}.pdf"
	    @image_dir = folder + "/images"
	    layout = erb.result(binding) 
	    layout_path = folder + "/output/#{@name}.rb"
	    File.open(layout_path, 'w'){|f| f.write layout}
	  end
  end
end