$LOAD_PATH << '.'
require 'dictionary'
require 'csv'

class Add
  def initialize(word,definiton)
    @word = word
    @definiton = definiton
    @dictionary = 'dictionary.csv'
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

    if $hashtable.key?(word)==true
      puts "\n ||------------------- || "
      puts "\n || Data already exist || "
      puts "\n ||------------------- || "
    else
      f = File.new(@dictionary, "a")
      f.puts "#{word},#{definiton}"
      f.close
      puts "\n ||---------------------------|| "
      puts "\n || New Word Added: #{word}   || "
      puts "\n ||-------------------------- || "
      puts
    end
  end
end
