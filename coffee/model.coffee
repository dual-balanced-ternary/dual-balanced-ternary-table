
{isPrime, isFactor} = require './is'
{mark} = require './mark'

unit = 40
size =
  x: Math.round (innerWidth / 2 / unit)
  y: Math.round (innerHeight / 2 / unit)
size.w = (size.x * 2) + 1
size.h = (size.y * 2) + 1

module.exports =
  init: ->
    @table = new Array size.w
    for _, index in @table
      piece = new Array size.h
      for _, index2 in piece
        piece[index2] = mark (index - size.x), (index2 - size.y)
      @table[index] = piece

  each: (callback) ->
    for piece, index in @table
      for value, index2 in piece
        x = index - size.x
        y = index2 - size.y
        callback x, y, value

  primes: (callback) ->
    for piece, index in @table
      for value, index2 in piece
        x = index - size.x
        y = index2 - size.y
        stat = isPrime x, y
        callback x, y, value, stat

  base: (a, b, callback) ->
    for piece, index in @table
      for value, index2 in piece
        x = index - size.x
        y = index2 - size.y
        stat = isFactor a, b, x, y
        callback x, y, value, stat
