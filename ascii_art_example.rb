=begin
************
*  $$  $$  *
*    ||    *
*  ######  *
*          *
************
=end
def show_hori_stars
  puts "\n\n"
    17.times {|x|  print "*"}
  puts "\n\n"
end

def show_vert_stars
    2.times{ |x|   print "   @@@" }
  puts "\n\n"

  i = 1
  3.times do
  	puts ("^" * i).center(15)
  	i += 2
  end

  for i in 1..4
    print " "
  end

  for i in 1..7
    print "_"
  end
  for i in 1..4
    print " "
  end

end


# calling the functions here
show_hori_stars
show_vert_stars
show_hori_stars
