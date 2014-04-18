
primes = require '../table/primes.json'
abs = Math.abs

exports.isPrime = (x, y) ->
  x = abs x
  y = abs y
  if y > x then [x, y] = [y, x]
  primes[x][y]

exports.isFactor = (a, b, x, y) ->
  if (a is 0) and (b is 0)
    return false
  sum = (a ** 2) + (b ** 2)
  c = ((a * x) + (b * y)) % sum
  d = ((a * y) - (b * x)) % sum
  (c is 0) and (d is 0)