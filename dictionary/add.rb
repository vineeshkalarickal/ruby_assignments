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

  def add_word
    word = self.get_word
    definiton = self.get_definiton
    puts ' ||------------------- || '
    if $hashtable.key?(word)==true
      puts ' || Data already exist || '
    else
      f = File.new(@dictionary, 'a')
      f.puts "#{word}, #{definiton}"
      f.close
      puts " || New Word Added: #{word}   || "
      puts
    end
    puts ' ||------------------- || '
  end
end
