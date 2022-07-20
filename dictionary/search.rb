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
      puts "\n ||-------------------------------- || "
      puts "\n    #{searchkey} is : #{$hashtable.fetch(searchkey, 'No data')}  "
      puts "\n ||---------------------------------|| "

    else
      puts "\n ||------------------- || "
      puts "\n || No Data Available  || "
      puts "\n ||------------------- || "
    end

  end

end
