$LOAD_PATH << '.'
require 'csv'
dictionary = 'dictionary.csv'

# initilize hash
$hashtable = Hash.new {}
# add data to Hash
File.open(dictionary).read.split("\n").each do |line|
  word, definiton = line.split(",")
  $hashtable[word] = definiton
end
