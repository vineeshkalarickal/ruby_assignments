$LOAD_PATH << '.'
require 'search'
require 'add'
require 'update'
require 'delete'


class Index
    def getmode
        puts "Choose a number to perform the action: "
        puts "1: Search, 2: Add, 3: Update, 4: Delete, 5: exit"
        mode = gets.chomp.to_i
        case mode
          when 1
              puts "Enter the word: "
              inputword = gets.chomp

              search = Search.new(inputword)
              key = search.get_keyword
              search.search_dictionary(key)

          when 2
              puts "Enter the word to be added: "
              word_input = gets.chomp
              puts "Enter the definiton to be added: "
              word_definition = gets.chomp

              add = Add.new(word_input,word_definition)
              key = add.addWord
          when 3
            puts "Enter the word to be updated: "
            word_input = gets.chomp
            puts "Enter the definiton to be updated: "
            word_definition = gets.chomp

            modify = Update.new(word_input,word_definition)
            key = modify.update_word

          when 4
            puts "Enter the word to be deleted: "
            word_input = gets.chomp

            del = Delete.new(word_input)
            key = del.delete_word

          when 5
            puts "Do you want to exit? Y/N "
            choice = gets.chomp.upcase
            if choice == "Y"
              at_exit { puts "Thank you" }
            else
              self.getmode
            end
          else
            puts "Wrong choice, Please enter numeric value \n"
            self.getmode
        end
    end
end

mode = Index.new
mode.getmode
