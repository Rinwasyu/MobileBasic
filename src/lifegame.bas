sub main
  dim width, height, size, i, j as integer
  width = screenWidth()
  height = screenHeight()
  size = 10
  dim field(width/size+2, height/size+2) as integer
  dim field_cp(width/size+2, height/size+2) as integer
  dim life as integer
  
  graphics //Graphic mode

  // initialize field
  for i = 2 to width/size + 1 step 1
    for j = 2 to height/size + 1 step 1
      field(i,j) = rnd(2)
    end for
  end for

  // main loop
  while true
    // field => field_cp
    for i = 1 to width/size + 2 step 1
      for j = 1 to height/size + 2 step 1
        field_cp(i,j) = field(i,j)
      end for
    end for

    
    for i = 2 to width/size+1 step 1
      for j = 2 to height/size+1 step 1

        life=field_cp(i-1,j-1)+field_cp(i-1,j)+field_cp(i-1,j+1)+field_cp(i,j-1)+field_cp(i,j+1)+field_cp(i+1,j-1)+field_cp(i+1,j)+field_cp(i+1,j+1)

        if (field_cp(i,j) = 1) then
          if (life = 2) or (life = 3) then
            field(i,j) = 1
          else
            field(i,j) = 0
          end if
        else
          if (life = 3) then
            field(i,j) = 1
          else
            field(i,j) = 0
          end if
        end if

        if (field(i,j) = 1) then
          setcolor 0,0,0,255
        else
          setcolor 255,255,255,255
        end if

        fillrect (i-2)*size,(j-2)*size,size,size
        //repaint
      end for
    end for
    repaint
    //sleep 100
  end while
end sub
