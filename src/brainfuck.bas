sub main
  dim program as string
  dim iptr as integer
  dim dptr as integer
  dim array(30000) as integer
  dim command as string
  dim depth as integer
  dim depth2 as integer
  dim result as string
  dim str as string

  //initialize
  input "Brain f*ck",program
  iptr = 1
  dptr = 1
  depth = 0
  result = ""

  while iptr <= len(program)
    command = mid$(program,iptr,1)
    if command = ">" then
      dptr = dptr + 1
    elseif command = "<" then
      dptr = dptr - 1
    elseif command = "+" then
      array(dptr) = array(dptr) + 1
    elseif command = "-" then
      array(dptr) = array(dptr) - 1
    elseif command = "." then
      //print chr$(array(dptr))
      result = result + chr$(array(dptr))
    elseif command = "," then
      input "Input",str
      array(dptr) = asc(str)
    elseif command = "[" then
      if array(dptr) = 0 then
        depth2 = depth + 1
        while depth2 > depth
          iptr = iptr + 1
          if mid$(program,iptr,1) = "]" then
            depth2 = depth2 - 1
          elseif mid$(program,iptr,1) = "[" then
            depth2 = depth2 + 1
          end if
        end while
      else
        depth = depth + 1
      end if
    elseif command = "]" then
      if array(dptr) = 0 then
        depth = depth - 1
      else
        depth2 = depth + 1
        while depth2 > depth
          iptr = iptr - 1
          if mid$(program,iptr,1) = "]" then
            depth2 = depth2 + 1
          elseif mid$(program,iptr,1) = "[" then
            depth2 = depth2 - 1
          end if
        end while
      end if
    end if
    iptr = iptr + 1
  end while
  print result
end sub
