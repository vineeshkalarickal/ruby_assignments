$LOAD_PATH << '.'
require 'dictionary'

class Search
  def initialize(search)
    @keyword = search
  end

  def get_keyword
    @keyword
  end

  def search_dictionary(searchkey)
    if $hashtable.key?(searchkey)==true
      print "Definition of #{searchkey} is :  "
      print $hashtable.fetch(searchkey, "Data inot found")
    else
      puts "Data not available"
    end

  end

end
