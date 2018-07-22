def calc(x, y, z)
    if (x =~ /\A[[:digit:]]+(\.[[:digit:]]+)?\Z/x) && (y =~ /\A[[:digit:]]+(\.[[:digit:]]+)?\Z/x)
        x = x.to_f; y = y.to_f
        if z == "add"; return "#{x} + #{y} = #{x + y}"
        elsif z == "subtract"; return "#{x} - #{y} = #{x - y}"
        elsif z == "multiply"; return "#{x} * #{y} = #{x * y}"
        elsif z == "divide"
            if y == 0; return "You can't divide by zero, try not making a blakchole."
            else; return "#{x} / #{y} = #{x / y}"
            end
        end
    end
end