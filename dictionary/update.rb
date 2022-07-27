$LOAD_PATH << '.'
require 'dictionary'
require 'csv'

class Update
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

  def update_word
    word = self.get_word
    definiton = self.get_definiton

    dict_word = ''
    dict_definiton = ''
    puts '||------------------- || '
    if $hashtable.key?(word)==true
      $hashtable[word] = definiton

      File.open(@dictionary, 'w+') do |fo|
        $hashtable.each do |word , definiton|
            fo.print "#{word}, #{definiton} \n"
        end
      end
      puts '|| Data Updated       || '
      self.list
    else
      puts '|| Data not found     || '
    end
    puts '||------------------- || '
  end

  def list
    word = self.get_word
    definiton = self.get_definiton
      $hashtable.each do |word , definiton|
          puts word + ' = ' + definiton
      end
  end

end
