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
        return result        
    end
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
print cls.cartesian
