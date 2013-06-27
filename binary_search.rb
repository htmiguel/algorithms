require 'benchmark'
  
def b_search(a,x)
  result = Benchmark.measure do
    p = 1
    r = a.count
    i = 1
    found = "NOT FOUND"
    while p <= r
      q = (p + r) / 2
      puts "we're in loop #{i} and p = #{p} and q = #{a[q-1]} and r = #{r}\n"
      if found == "NOT FOUND"    
        if a[q-1] == x
          puts "x is #{x}\nWE ARE DONE!!!"
          return
        elsif a[q-1] > x
          puts "moving to the left side of the array"
          r = q-1
        else
          puts "moving to the right side of the array"
          p = q+1
        end
      end
      found = 'NOT FOUND'
      i += 1
    end  
    return found
  end
  puts result
end

def recursive_search(a,p,r,x)
  result = Benchmark.measure do
    if p > r
      return 'NOT FOUND'
    else 
      q = (p + r) / 2
      if a[q-1] == x
        return 'FOUND'
      elsif a[q-1] > x
        recursive_search(a, p, q - 1, x)
      else
        recursive_search(a, q+1, r, x)
      end
    end
  end
  puts result
end