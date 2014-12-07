#!/usr/bin/env ruby
#
# [En|De]code Hamming code.
#

class HammingCoder
# 1. string -> boolean array
#  def encode(stream)
#    data = []
#    stream.each do |char|
#      if char == "0"
#        

  def is_power_of_2(num)
    if (num).to_s(2).scan(/1/).size == 1
      return true
    else
      return false
    end
  end

  def loop(data, offset)
    for i in offset..data.length
      # insert if position is a power of 2
      # always insert at position 0
      # never insert at end
      if (is_power_of_2(i+1) && i != data.length) || i == 0
        #puts("#{i} P")
        # placeholder = 0 for algorithm to work
        data.insert(i, 0)
        return data, i+1
      end
    end
    return data, data.length
  end

  def encode(data)
    # insert parity bits ('placeholders')
    offset = 0
    # since the data array gets bigger every time we insert a parity
    # bit, we have to start from the beginning again to get the length
    # right. so we use a function and keep track of the offset until
    # we get to the end of the array.
    while offset != data.length
      data, offset = loop(data, offset)
    end

    # temporary print
    #for element in data
    #  print element
    #end
    #puts

    # set parity bits
    for i in 0..data.length
      if (is_power_of_2(i+1) && i != data.length) || i == 0
        positions = positions(i+1, data.length)
        parity = 0
        for position in positions
          #puts "position - 1: #{position-1}"
          parity += data[position-1]
        end
        if parity % 2 == 0
          data[i] = 0
        else
          data[i] = 1
        end
      end
    end

    return data
  end

  def positions(num, max)
    positions = Array.new

    orig = num
    for num in (num..max).step(num*2)
      for i in num..num+orig-1
        if i <= max
          positions << i
        end
      end
    end

    return positions
  end
end

data = [1, 0, 1, 1, 0, 0, 1, 1]

hamming = HammingCoder.new

print hamming.encode(data)
puts
