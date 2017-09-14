require 'nokogiri'
require 'open-uri'
require 'byebug'
links = ['https://genius.com/artists/Sam-smith']
song_links = []
links.each do |link|
  links.shift
  doc = Nokogiri::HTML(open(link))

  doc.css('a.mini_card').each do |link|
    song_links.push(link.to_s[/href="(.*)" /, 1])
  end
end
puts song_links
counter = 1
song_links.each do |song_link|
  puts "song #{counter}"
  counter += 1
  puts "\n\n"
  doc = Nokogiri::HTML(open(song_link))
  doc.css('a.referent').each do |link|
    puts link.content
  end
  puts "\n\n"
end
