
model = require './model'
view = require './view'

model.init()
view.init()

canvas = document.querySelector '#canvas'
canvas.onclick = (event) ->
  view.base event.offsetX, event.offsetY

window.onkeydown = (event) ->
  switch event.keyCode
    when 32
      event.preventDefault()
      view.show()
    when 13
      event.preventDefault()
      view.primes()

view.show()