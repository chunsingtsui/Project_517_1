class Array
  def factorial_and_square_with_index
    for i in 0 ... self.size
      fact = 1
      for j in 2 ... self[i]+1
        fact = fact * j
      end
      yield  fact, self[i]*self[i] , i
    end
  end

  def attribute_accessor( *instance_variables )
    instance_variables.each do |instance_variable|
      class_eval %Q?
          def #{instance_variable}
              @#{instance_variable}
          end
          @#{instance_variable}
          end
          def #{instance_variable}=( new_value )
              @#{instance_variable} = new_value
          end
        ?
    end
  end
end


