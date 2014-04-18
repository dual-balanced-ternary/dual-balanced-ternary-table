
canvas = document.querySelector '#canvas'
ctx = canvas.getContext '2d'

model = require './model'

unit = 40
cx = innerWidth / 2
cy = innerHeight / 2

module.exports =
  init: ->
    canvas.setAttribute 'width', innerWidth
    canvas.setAttribute 'height', innerHeight

  clear: ->
    ctx.clearRect 0, 0, innerWidth, innerHeight

  show: ->
    @clear()
    model.each (x, y, value) =>
      a = cx + (unit * x)
      b = cy + (unit * y)
      render a, b, value, 'white'

  primes: ->
    @clear()
    model.primes (x, y, value, stat) =>
      a = cx + (unit * x)
      b = cy + (unit * y)
      console.log stat
      color = if stat then 'blue' else 'white'
      render a, b, value, color

  base: (x, y) ->
    @clear()
    xn = Math.round ((x - cx) / unit)
    yn = Math.round ((y - cy) / unit)
    model.base xn, yn, (x, y, value, stat) =>
      a = cx + (unit * x)
      b = cy + (unit * y)
      color = if stat then 'blue' else 'white'
      render a, b, value, color

render = (x, y, value, bg) ->
  ctx.fillStyle = bg or 'white'
  u = unit / 2
  ctx.fillRect (x - u), (y - u), unit, unit
  ctx.textBaseline = 'middle'
  ctx.textAlign = 'center'
  ctx.font = '10px Optima'
  ctx.fillStyle = 'black'
  ctx.fillText "#{value}", x, y