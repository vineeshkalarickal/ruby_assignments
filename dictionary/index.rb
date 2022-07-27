$LOAD_PATH << '.'
require 'search'
require 'add'
require 'update'
require 'delete'
class Index
  def getmode
    puts 'Choose a number to perform the action: '
    puts '1: Search, 2: Add, 3: Update, 4: Delete, 5: exit'
    mode = gets.chomp.to_i
    choice_proc = Proc.new { |choice|
      choice == 'Y' ? at_exit { puts '|| See you, Thank you ||' } : self.getmode
    }

    case mode
    when 1
      puts 'Enter the word: '
      inputword = gets.chomp
      search = Search.new(inputword)
      key = search.get_keyword.downcase
      search.search_dictionary(key)
    when 2
      puts 'Enter the word to be added: '
      word_input = gets.chomp.downcase
      puts 'Enter the definiton to be added: '
      word_definition = gets.chomp
      add = Add.new(word_input,word_definition)
      add.add_word
    when 3
      puts 'Enter the word to be updated: '
      word_input = gets.chomp.downcase
      puts 'Enter the definiton to be updated: '
      word_definition = gets.chomp
      modify = Update.new(word_input,word_definition)
      modify.update_word
    when 4
      puts 'Enter the word to be deleted: '
      word_input = gets.chomp.downcase
      del = Delete.new(word_input)
      del.delete_word
    when 5
      puts 'Do you want to exit? Y/N '
      choice = gets.chomp.upcase
      choice_proc.call(choice)
    else
      puts 'Wrong choice, Please enter numeric value \n'
      self.getmode
    end
  end
end

mode = Index.new
mode.getmode
