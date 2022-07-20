$LOAD_PATH << '.'
require 'dictionary'

class Add
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

  def addWord
    word = self.get_word
    definiton = self.get_definiton
   $hashtable[word] = definiton
   puts "Word added "
   puts
   self.list
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
