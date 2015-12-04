::::::::::::::
pg5_1.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 104                  C++ and Fortran 90

PROGRAM analysis

  REAL , DIMENSION(100) :: data
  REAL , EXTERNAL :: mean
    CALL get_data(data , 100)
    PRINT * ,'Average ', mean(data , 100)
  STOP ' normal exit : analysis '
END PROGRAM analysis

SUBROUTINE get_data(dat , n)
  INTEGER :: j , n
  REAL , DIMENSION(:) :: dat
  DO j = 1 , n
    READ * , dat(j)
  ENDDO
  RETURN
END SUBROUTINE get_data

REAL FUNCTION mean(a , m)
  INTEGER :: m
  REAL , DIMENSION(:) :: a
  REAL :: sum=0.0
    DO j = 1 , m
      sum = sum + a(j)
    ENDDO
  mean = sum / REAL(m)
  RETURN
END FUNCTION mean

::::::::::::::
pg5_2.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 108                  C++ and Fortran 90

PROGRAM outsub

  REAL :: x = 3.14159 , y = 2.71828    ! , z   text error
  CALL out(x)
  CALL out(y)
  CALL out(x**2 + y - 0.3)
  STOP ' normal exit from outsub'
END PROGRAM outsub

SUBROUTINE out(u)
  REAL :: u
  PRINT * , ' The value is ' , u
  RETURN
END SUBROUTINE out

::::::::::::::
pg5_3.f90
::::::::::::::

!!  Barlow and Barnett, Computing for Scientists 1998
!!  page 111                  C++ and Fortran 90

!! Compile the module first

MODULE  graph_ps
                   ! type definition
  TYPE point
     REAL :: x , y
  END TYPE point
                   ! global data
  REAL    :: scale = 400.0
  INTEGER :: graphics_unit = 20

CONTAINS

  SUBROUTINE circle(p,r)
    TYPE(point) :: p
    REAL :: r
    CHARACTER(7)::form = "(3I8,A)"
    WRITE(graphics_unit ,  form) &
         NINT(p%x * scale) ,  &
         NINT(p%y * scale) ,  &
         NINT(scale * r) , ' 0 360 arc stroke'
    RETURN
  END SUBROUTINE circle

  SUBROUTINE line(from , to)
    TYPE(point) :: from , to
    CHARACTER(7):: form = "(2I8,A)"
    WRITE(graphics_unit ,  form) &
         NINT(scale * from%x),  &
         NINT(scale * from%y),' moveto'
    WRITE(graphics_unit , form) &
         NINT(scale * to%x) ,  &
         NINT(scale * to%y),' lineto stroke'
    RETURN
  END SUBROUTINE line
  
END MODULE  graph_ps



PROGRAM testplot

  USE graph_ps
                        ! define 8 pointed star
  TYPE (point) :: star(8)
  INTEGER :: i , j
  REAL :: theta
                        ! open file for output
  OPEN(graphics_unit,file = 'plot001.ps')
  WRITE(graphics_unit , *) '%!PS'
  WRITE(graphics_unit , *) 'gsave'

  DO i=1,8              ! define 8 points
     theta = (REAL(i)-0.5) * 3.14159 / 4.
     star(i)%x = 0.5 + 0.5*cos(theta)
     star(i)%y = 0.5 + 0.5*sin(theta)
  ENDDO
                        ! draw 8 circles
  DO i=1,8
     CALL circle(star(i) , .05)
  ENDDO
  ! draw  lots  of  lines
  DO i=2,8
     DO j=1,i
        CALL  line(star(i) , star(j))
     ENDDO
  ENDDO

  WRITE(graphics_unit , *) 'showpage grestore'

END PROGRAM testplot

::::::::::::::
pg5_4.f90
::::::::::::::

!!  Barlow and Barnett, Computing for Scientists 1998
!!  page 112                  C++ and Fortran 90

PROGRAM bug

  INTEGER :: i
  DO i = 1 , 10
     CALL fred(i)
     PRINT * , i
  ENDDO
END PROGRAM bug

SUBROUTINE fred(index)
! INTEGER , intent(in) :: index  ! prevents the bug
  INTEGER :: index
  index = index + 1
  RETURN
END SUBROUTINE fred

::::::::::::::
pg5_7.f90
::::::::::::::

!!  Barlow and Barnett, Computing for Scientists 1998
!!  page 116                  C++ and Fortran 90


REAL FUNCTION FOCAL(object , image)                       ! simplest version
  
  ! FOCAL (LENGTH) returns the lens formula 1.0/( 1.0/object +  1.0/image)
  
  REAL, INTENT(IN) :: object , image
  LOGICAL :: zerotest0 , zerotest1 , inftest , totaltest  ! if .TRUE. abort
  REAL    :: u , v , zero = 0.E0 , biggest = 1.E30        ! chosen cutoff value
  zerotest0 = ( (u + v) == zero )                         ! better than nothing
  zerotest1 = ( (u + v) <= EPSILON(u) * (ABS(u) + ABS(v)))! a big improvement
  inftest   = ( ABS(u) >= biggest .OR.  ABS(v) >= biggest)! data too large
  totaltest = ( zerotest1 .OR. inftest )                  ! combines the last two
 
  FOCAL = object * image / (object + image)
END FUNCTION FOCAL

::::::::::::::
pg5_8.f90
::::::::::::::

!!  Barlow and Barnett, Computing for Scientists 1998
!!  page 117                  C++ and Fortran 90

SUBROUTINE total(value , weight)
  REAL , INTENT(IN) :: value 
  REAL , INTENT(IN) , OPTIONAL ::  weight
  REAL :: w
  ! sumw and avg are global variables
  IF (PRESENT(weight)) THEN
     w = weight
  ELSE
     w = 1.0
  ENDIF
  sumw = sumw + w
  avg  = avg  + w*(value-avg) / sumw
  RETURN 
END SUBROUTINE total

::::::::::::::
pg5_9.f90
::::::::::::::

!!  Barlow and Barnett, Computing for Scientists 1998
!!  page 117                  C++ and Fortran 90


INTERFACE fred

   REAL FUNCTION  fred1(arg)
     REAL :: arg
   END FUNCTION fred1

   REAL FUNCTION  fred2(arg)
     INTEGER :: arg
   END FUNCTION fred2

END INTERFACE

::::::::::::::
pg5_10.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 119                  C++ and Fortran 90

PROGRAM testseek
  implicit none
  REAL , EXTERNAL :: fun   ! this EXTERNAL is compulsory
                           ! for an argument which is a function 
  REAL , EXTERNAL :: seek  ! this EXTERNAL is optional
                           ! but strongly recommended

  PRINT * , ' zero at' , seek(fun , .01 , 3. , 20)
  STOP ' normal exit from testseek' 
END

REAL FUNCTION fun(x)
  implicit none
  REAL , INTENT(IN) :: x
  fun = SIN(x) - 0.5*x     ! SIN is INTRINSIC and known
END FUNCTION fun

REAL FUNCTION seek(f ,  low , high , n)
  implicit none
  REAL , INTENT(IN) :: low , high
  REAL ::  lo , hi , mid , flo , fhi , fmid   
  REAL , EXTERNAL :: f
  INTEGER ,  INTENT(IN) :: n 
  INTEGER :: i
  lo = low ; hi = high ; flo = f(lo) ; fhi = f(hi)
  
  DO i=1 , n
     mid = 0.5 * (hi + lo)
     fmid = f(mid)
     IF (fmid*fhi < 0.0) THEN
        lo = mid;  flo = fmid
     ELSE
        hi = mid;  fhi = fmid
     ENDIF
  ENDDO

  seek = mid

END FUNCTION seek

::::::::::::::
pg5_12.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 122                  C++ and Fortran 90

! test 0 1 10 12 13 14 15 and explain

PROGRAM recurse

  integer :: ff , fff , ff4
  integer , external :: factorial , Rfactorial

  DO
     PRINT * , ' integer please '
     READ  * , ff
     fff = factorial(ff) 
     PRINT * , fff , REAL(fff) 
     ff4 = Rfactorial(ff)              ! direct multiplication 
     PRINT * , ff4 , REAL(ff4) 
  ENDDO

END PROGRAM recurse

RECURSIVE INTEGER FUNCTION factorial(r) RESULT(nfact)
  ! RECURSIVE     FUNCTION factorial(r) RESULT(nfact)
  INTEGER :: r
  IF (r <= 1) THEN
     nfact = 1
  ELSE
     nfact = r * factorial(r-1)
  ENDIF
  RETURN
END FUNCTION factorial

INTEGER FUNCTION Rfactorial(r) RESULT(nfact)
  ! the direct calculation
  INTEGER :: n = 1 , j , r
 !  n =  1             ! run again with this included, and explain
  DO j = 1 , r
     n = n * j
  ENDDO
  nfact = n
  RETURN
END FUNCTION Rfactorial

