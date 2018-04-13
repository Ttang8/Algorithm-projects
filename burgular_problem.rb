def burgular(array)
  calc = [array[0], array[1]]
  houses = [[0],[1]]
  array[2..-1].each_with_index do |num,idx|
    if (num + calc[-2]) > calc[-1]
      calc << num + calc[-2]
      combo = houses[idx] + [idx + 2]
      houses << combo
    else
      calc << calc[-1]
      houses << houses[idx+1]
    end
  end
  p houses
  max = calc.max
  index = calc.index(max)
  [houses[index], calc[index]]
end

arr = [1,5,16,20,3,7,10,5,10,24,17]
puts burgular(arr) == [[1,3,6,8,10], 62]
