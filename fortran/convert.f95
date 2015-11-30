      program convert

      ! Convert a number of seconds to the "hours, minutes, seconds"
      ! Cnotation. Written 23-11-15 by Tarek Allam Jr.
      ! page 16.
      integer :: hour, minute, second, total
      print *, 'Time in seconds?'
      read *, total
        hour = total/3600   ! 3600 secs/hour
        minute = (total-3600*hour)/60
        second = total-3600*hour-60*minute
      print *, 'A time of ', total, ' seconds'
      print *, 'Is equivulent to '
      print *, hour, 'Hours'
      print *, minute, 'Minutes and '
      print *, second, 'Seconds'
      stop 'convert ended normally'
      end program convert
