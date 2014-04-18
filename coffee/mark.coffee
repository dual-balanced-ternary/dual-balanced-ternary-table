
abs = Math.abs

parse = (n) ->
  list = new Array 5
  for times in [4..0]
    unit = 3 ** times
    positive = abs(n - unit)
    zero = abs(n)
    negtive = abs(n + unit)
    if (positive < zero) and (positive < negtive)
      list[times] = 1
      n = n - unit
    else if (zero < positive) and (zero < negtive)
      list[times] = 0
      n = n
    else if (negtive < zero) and (negtive < positive)
      list[times] = -1
      n = n + unit
  list.reverse()

digits = [
  [6, 1, 8]
  [7, 5, 3]
  [2, 9, 4]
]

exports.mark = (x, y) ->
  xList = parse x
  yList = parse y
  list = new Array 5
  for i in [0..4]
    list[i] = digits[yList[i] + 1][xList[i] + 1]
  while (list.length > 1) and (list[0] is 5)
    list.shift()
  list.join('')