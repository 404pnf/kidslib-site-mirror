require 'find'

def change_url(file)
  c = File.read(file).gsub('http://kidslib.fltrp.com/asset/', '/asset/')
  File.write(file, c)
  p "#{file} changed"
end

def main(path)
  col = Find.find(path).select { |e| e =~ /html$/ }
  col.each { |e| change_url e }
end

main(ARGV[0])


