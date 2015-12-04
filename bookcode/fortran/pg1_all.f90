:::::::::::::
pg1_1.f90
:::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 16                  C++ and Fortran 90


!      The Fortran 90 version
!
PROGRAM convert
  !
  ! Convert a number of seconds to the
  ! "hours, minutes, seconds" notation
  !  Written 15-Dec-1997
  ! by Alfred User
  INTEGER :: hour, minute, second, total
  PRINT * , ' Time in seconds?'
  READ  * , total
  hour = total / 3600              ! 3600 secs/hour
  minute = (total - 3600*hour) / 60
  second =  total - 3600*hour - 60*minute
  PRINT * , ' A time of ' , total , &
       ' seconds'
  PRINT * , ' Is equivalent to '
  PRINT * , ' ' , hour , ' Hours'
  PRINT * , ' ' , minute , ' Minutes and'
  PRINT * , ' ' , second , ' Seconds'
  STOP  ' convert ended normally'
END PROGRAM convert

