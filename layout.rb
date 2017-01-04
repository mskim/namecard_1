# encoding: UTF-8

# this goes at top left
@output_path = "<%= @output_path %>"
@image_dir   = "<%= @image_dir %>"

logo 	= RLayout::Image.new(tag: "logo", local_image: "1.jpg", image_fit_type: 4)
# qrcode  = RLayout::Image.new(tag: "qrcode", local_image: "qrcode/<%= @name %>.png", width: 200, height: 200)
# This goes somewhere in the middle
personal = RLayout::Container.new(tag: "personal", width: 150, height: 60) do
  text(tag: "name", text_string: "<%= @name %>", text_size: 12, font: "smGothicP-W70")
  text(tag: "title", text_string: "<%= @title %>", text_size: 12, font: "smMyungjoP-W30")
  text(tag: "email", text_string: "<%= @email %>", text_size: 12)
  text(tag: "cell", text_string: "<%= @cell %>", text_size: 12)
  relayout!
end

# This goes at the bottom
company = RLayout::Container.new(tag: "company", width: 200, height: 40) do
  text(tag: "address1", text_string: "102 Happy Rd.", text_size: 10, text_alignment: "left")
  text(tag: "address2", text_string: "Sung Nam, Kyunggi-Do Korea 11356", text_size: 10, text_alignment: "left")
  text(tag: "www", text_string: "www.my_site.com", text_size: 10, text_alignment: "left")
  relayout!
end


# Assign place holders for partials,  
# and replace it with partial graphics above, logo, personal, and company.
# each partial is also replaced with variable data from csv.

front_page = RLayout::Page.new(margin: 10, paper_size: 'NAMECARD', grid_base: "6x6", gutter: 20, v_gutter: 5) do
  container(tag: "logo", grid_frame: [0,0,4,1], layout_expand: nil)
  container(tag: "personal", grid_frame: [2,0,4,3], layout_expand: nil)
  container(tag: "company", grid_frame: [1,4,5,2], layout_expand: nil)
  place(logo)
  place(personal)
  place(company)
end

personal2 = RLayout::Container.new(tag: "personal2", width: 150, height: 60) do
  text(tag: "name", text_string: "<%= @en_name %>", text_size: 12)
  text(tag: "title", text_string: "<%= @en_title %>", text_size: 12)
  text(tag: "email", text_string: "<%= @email %>", text_size: 12)
  text(tag: "cell", text_string: "<%= @cell %>", text_size: 12)
  relayout!
end

back_page = RLayout::Page.new(margin: 10, paper_size: 'NAMECARD', grid_base: "6x6", gutter: 20, v_gutter: 5) do
  # container(tag: "qrcode", grid_frame: [2,1,2,4], layout_expand: nil)
  container(tag: "personal2", grid_frame: [2,0,4,3], layout_expand: nil)
  container(tag: "company", grid_frame: [1,4,5,2], layout_expand: nil)
  # place(qrcode)
  place(personal2)
  place(company)
end

RLayout::Document.new(paper_size: 'NAMECARD', initial_page:false) do
  add_page(front_page)
  add_page(back_page)
end