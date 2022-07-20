$LOAD_PATH << '.'
require 'dictionary'

class Update
  def initialize(word,definiton)
    @word = word
    @definiton = definiton
  end

  def get_word
    @word
  end

  def get_definiton
    @definiton
  end

  def update_word
    word = self.get_word
    definiton = self.get_definiton

    if $hashtable.key?(word)==true
      $hashtable[word] = definiton
      puts "\n Definition updated "
      self.list
    else
      puts "The word not found in the dictionary"
    end
   puts
  end

  def list
    word = self.get_word
    definiton = self.get_definiton
      $hashtable.each do |word , definiton|
          puts word + ' = ' + definiton
      end
  end

end
