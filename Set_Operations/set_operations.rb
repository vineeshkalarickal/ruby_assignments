require "set"
class SetOperations
    #union, intersection, compliment and cartesian product
    $setA = [1,2,4,5]
    $setB = [1,7,3,4,6]

    def show
        result = "Set A: #{$setA} \nSet B: #{$setB}"
        return result
    end
    
    def union
        result = $setA | $setB
        return result
    end

    def intersection
        result = $setA & $setB
        return result
    end

    def compliment
        result = $setA - $setB
        return result
    end


    def cartesian
        result = Set.new
        $setA.each do |valueA|
            $setB.each do |valueB|
                result.add("(#{valueA} , #{valueB})")
            end        
        end
        puts result
        
    end

        # puts "Cartesian Product Output :"
        # i = 0
        # while i < $setA.length()
        #     j = 0
        #     while j < $setB.length()
        #         if(i == 0 && j == 0)
        #             print "{{ #{$setA[i]} , #{$setB[j] } } ,"
        #         elsif(i == $setA.length()-1 && j == $setB.length()-1)
        #             print "{ #{$setA[i]} , #{$setB[j] } } }"
        #         else
        #             print "{ #{$setA[i]} , #{$setB[j] } } ,"
        #         end
        #         j = j + 1
        #     end
        #     print "\n"
        #     i = i + 1
        # end

end


cls = SetOperations.new
 
puts cls.show

puts "\n--Union--"
print cls.union

puts "\n--Intersection--"
print cls.intersection

puts "\n--compliment--"
print cls.compliment

puts "\n--Cartesian--"
cls.cartesian
