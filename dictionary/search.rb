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
    puts '||------------------- || '
    if $hashtable.key?(searchkey)==true
      puts "  #{searchkey} is : #{$hashtable.fetch(searchkey, 'No data')}  "
    else
      puts '|| No Data Available  || '
    end
    puts '||------------------- || '
  end
end
