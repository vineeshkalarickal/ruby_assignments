$LOAD_PATH << '.'
require 'dictionary'

class Delete
  def initialize(word)
    @word = word
    @dictionary = 'dictionary.csv'
  end

  def get_word
    @word
  end

  def delete_word
    word = self.get_word
    puts '||-------------------|| '
    if $hashtable.key?(word)==true
      $hashtable.delete(word)
      File.open(@dictionary, 'w+') do |fo|
        $hashtable.each do |word, definiton|
          fo.print "#{word}, #{definiton} \n"
        end
      end
      puts '|| Data Deleted       || '
    else
      puts '||-------------------|| '
      puts '|| Data not found    || '
    end
    puts '||-------------------|| '
  end

  def list
    $hashtable.each do |key, value|
      puts " #{key} : #{value}"
    end
  end
end
