class ConvertNumToWords
  @@ar_ones_pos = [ "","one ","two ","three ","four ","five ", "six ", "seven ", "eight ","nine ", "ten ","eleven ", "twelve ","thirteen ", "fourteen ", "fifteen ","sixteen ", "seventeen ", "eighteen ","nineteen "]
  
  @@ar_tens_pos = [ "", "", "twenty ", "thirty ", "forty ","fifty ", "sixty ", "seventy ", "eighty ","ninety "]

  def num_to_words(_number, words)
    str = ''
    if _number > 19
      str += (@@ar_tens_pos[_number / 10])
      str += (@@ar_ones_pos[_number % 10])
    else
      str += @@ar_ones_pos[_number]
    end
    # if _number is non-zero
    if _number != 0
      str += words
    end
    return str
  end

  def convert_to_words(_number)
    out = ''
    out += num_to_words((_number / 10000000), "crore")
    out += num_to_words(((_number / 100000) % 100), "lakh ")
    out += num_to_words(((_number / 1000) % 100),"thousand ")
    out += num_to_words(((_number / 100) % 10),"hundred ")
    if _number > 100 && _number % 100
      out += 'and '
    end
    out += num_to_words((_number % 100), '')
    return out
  end
end

# convert given _number in words
convert_word = ConvertNumToWords.new

File.open('output.txt', 'w+') do |file_to_write|

  File.open('input.txt').each do |line|
    file_to_write.puts(convert_word.convert_to_words(line.to_i))
  end
end