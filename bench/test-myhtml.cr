require "myhtml"

page = File.read("./google.html")

t = Time.local
1000.times do
  myhtml = Myhtml::Parser.new(page)
  myhtml.free
end
p Time.local - t

t = Time.local
s = 0
links = [] of String
myhtml = Myhtml::Parser.new(page)
1000.times do
  links = myhtml.css("div.g div.r a").map(&.attribute_by("href")).to_a
  s += links.size
end
p links.last?
p s
p Time.local - t
