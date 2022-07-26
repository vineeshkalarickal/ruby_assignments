module BillCalculator
    @totAmount = 0

    def calculate(uname,units)
        if(units <= 100)
            @totAmount = units*6
        elsif(units > 100 && units <= 300)
            @extra_units = units - 100
            @totAmount = 100*6 + @extra_units*11
        else
            @extra_units = units - 300 
            @totAmount = 100*6 + 200*11 + @extra_units*15
        end

        if(@totAmount > 300)
            @totAmount = @totAmount + (15*@totAmount)/100
        else
            @totAmount = @totAmount + (5*@totAmount)/100
        end

        if(@totAmount < 50)
            @totAmount = 50
        end

        return @totAmount
    end
end


#Logic is good, 
#return in the end is not required
#overall looks good
