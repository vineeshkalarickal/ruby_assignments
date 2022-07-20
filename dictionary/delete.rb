$LOAD_PATH << '.'
require 'dictionary'

class Delete
  def initialize(word)
    @word = word
  end

  def get_word
    @word
  end

  def delete_word
    word = self.get_word
    if $hashtable.key?(word)==true
      $hashtable.delete(word)
      puts "\n Word removed "
      self.list
    else
      puts "The word not found in the dictionary"
    end
   puts
  end

  def list
      $hashtable.each do |key, value|
        puts " #{key} : #{value}"
      end
  end

end
