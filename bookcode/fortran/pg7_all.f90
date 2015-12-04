:::::::::::::
pg7_9.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 165                  C++ and Fortran 90


PROGRAM fpoint
  REAL , POINTER :: p           ! p declared but not allocated

  !... can't use p here...

  ALLOCATE(p)                   ! p now allocated 
  p = 13.7                      ! p is used just like any other REAL
  DEALLOCATE(p)                 ! free the memory

  !... can't use p here either ...

END

::::::::::::::
pg7_10.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 166                  C++ and Fortran 90

PROGRAM tarpoint
  REAL , TARGET  :: x , y
  REAL , POINTER :: p , q
  !...
  y = 1.234
  p => x                ! pointer assign p to x
  p = y                 ! normal assignment of y to p
  PRINT * , x           ! will give 1.234
  q => p                ! x, p, and q are now equivalent
  
  PRINT * , p , q , x
END

::::::::::::::
pg7_11.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 166                  C++ and Fortran 90

PROGRAM grid
  REAL , TARGET  :: allgrids(10 , 10 , 1000)
  REAL , POINTER :: thisgrid(: , :)
    !...

  thisgrid => allgrids(: , : , 15)   ! text error is (; , ; , 15)
    ! ...

  NULLIFY(thisgrid)

END PROGRAM grid
