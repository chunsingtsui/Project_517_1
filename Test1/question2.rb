class Question2

  class Array
    def testQuestion
      for i in 0 ... self.size
        fact = 1
        for j in 2 .. self.size
          fact = fact * j
        end
        yield  i, self[i] , fact
      end
    end


  end

  arr = [1,3,5]
    arr.testQuestion do |a, b, c|;
    puts "Factorial and square of element at index #{c} are #{a} and #{b}"
  end



end