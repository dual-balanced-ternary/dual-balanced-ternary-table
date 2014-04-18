
table = []
limit = 100

abs = Math.abs

for x in [0...limit]
  piece = []
  for y in [0...x]
    piece.push yes
  table.push piece

for x in [2...limit]
  for y in [0...x]
    if table[x][y]
      a = x
      b = y
      loop
        e = a
        f = b
        loop
          e -= y
          f += x
          e_ = abs e
          f_ = abs f
          if f_ > e_ then [e_, f_] = [f_, e_]
          break if e_ >= limit
          table[e_][f_] = no
        e = a
        f = b
        loop
          e += y
          f -= x
          e_ = abs e
          f_ = abs f
          if f_ > e_ then [e_, f_] = [f_, e_]
          break if e_ >= limit
          table[e_][f_] = no
        a += x
        b += y
        break if a >= limit
        table[a][b] = no

table[1][0] = no
table[2][0] = no

content = JSON.stringify(table, null, 2)

require('fs').writeFile 'primes.json', content