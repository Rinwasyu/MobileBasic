sub main
  dim a,b,t,width,height,x,y,mag as double
  width = screenwidth()
  height = screenheight()
  mag = 300
  graphics
  input "x = cos(? * t)", a
  input "y = sin(? * t)", b
  setfont "", 30

  while t < 2.0 * pi
    x = mag * cos(a * t) + width / 2.0
    y = mag * sin(b * t) + height / 2.0
    plot x, y
    //drawstring ".", x, y
    t = t + 0.0001
    repaint
  end while

  sleep 100000
end sub
