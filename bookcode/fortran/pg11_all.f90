::::::::::::::
pg11_1.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 252 - 253           C++ and Fortran 90

!! all 3 methods in this file

!! (1) extra argument

SUBROUTINE mypoint(x , y , s)
  REAL , INTENT(IN):: x , y , s
  CALL point(x*s , y*s)
  RETURN
END


!! (2) global data

MODULE plotting
  REAL , PUBLIC :: s
CONTAINS
  SUBROUTINE myplot(x , y)
    REAL ,INTENT(IN) :: x , y
    plot(x*s , y*s)
    RETURN
  END SUBROUTINE myplot
END MODULE plotting

!! (3) module with private data

MODULE plotting
  REAL , PRIVATE :: s
CONTAINS
  SUBROUTINE myplot(x , y)
    REAL ,INTENT(IN) :: x , y
    plot(x*s , y*s)
    RETURN
  END SUBROUTINE myplot
  SUBROUTINE set_scale(SS)
    REAL ,INTENT(IN) :: SS
    S = SS
    RETURN
  END SUBROUTINE set_scale
END MODULE plotting

::::::::::::::
pg11_2.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 255                 C++ and Fortran 90

PROGRAM Answer4_8

! uses Newton's method to approximate where x = COS(x)

  INTEGER :: k		
  REAL    :: x	
  REAL , EXTERNAL :: F , DF
  x = 0.0
  DO k = 1,10
     x = x - F(x)/DF(x)
     IF(ABS(F(x)) <= 0.0001) EXIT
  ENDDO
  PRINT * , x , COS(x) , x - COS(x)
  !  ...
END PROGRAM Answer4_8

FUNCTION f(x)
  REAL :: f
  REAL , INTENT(IN) :: x
  f = x - COS(x)
  RETURN
END FUNCTION f

FUNCTION df(x)
  REAL :: df
  REAL , INTENT(IN) :: x
  df = 1 + SIN(x)
  RETURN
END FUNCTION df

::::::::::::::
pg11_3.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 230                 C++ and Fortran 90

PROGRAM factest
  IMPLICIT NONE
  REAL , EXTERNAL :: Rfactorial
  REAL    :: out(4) = 0
  INTEGER :: j , k(4) = (/4 , 13 , 24 , 0/)
  DO j = 1 , 4
     out(j) = Rfactorial(k(j))
     PRINT * , k(j) , out(j)
  ENDDO
  STOP
END PROGRAM factest


! direct calculation of the factorial

FUNCTION Rfactorial(r)
  IMPLICIT NONE
  INTEGER :: r, j
  REAL    :: x , Rfactorial
  IF (r < 1 ) STOP ' factorial < 1 '
  x = 1.0            ! note that setting this in the declaration
                     ! invokes SAVE - definitely not wanted here
  DO j = 2 , r       ! r = 1 skips the loop
     x = x * REAL(j)
  ENDDO
  Rfactorial = x
  RETURN
END FUNCTION Rfactorial

::::::::::::::
pg11_4.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 230                 C++ and Fortran 90

PROGRAM factest
implicit none
  REAL , EXTERNAL :: Rfactorial
  REAL    :: out(4) = 0
  INTEGER :: j , k(4) = (/4 , 13 , 24 , 0/)
  DO j = 1 , 4
     out(j) = Rfactorial(k(j))
     PRINT * , k(j) , out(j)
  ENDDO
!  PRINT '(I15)' , k
!  PRINT '(F15.0)' , out
  STOP
END PROGRAM factest


! direct calculation of the factorial

FUNCTION Rfactorial(r)
implicit none
  INTEGER :: r, j
  REAL    :: x , Rfactorial
  PRINT * , r
  IF (r < 1 ) STOP ' factorial < 1 '
  x = 1.0            ! note that setting this in the declaration
                     ! invokes SAVE - definitely not wanted here
  DO j = 2 , r       ! r = 1 skips the loop
     x = x * REAL(j)
  ENDDO
  Rfactorial = x
  RETURN
END FUNCTION Rfactorial

::::::::::::::
pg11_5.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 260                 C++ and Fortran 90

! illustrates unnessary errors

PROGRAM water_mean

  PARAMETER  (N=4)
  REAL :: c(1:N), cmean , fmean
  CHARACTER (LEN=10) :: FMT 
  DATA c/3.782, 5.540, 5.769, 7.066/


  fmean = SUM(c) / REAL(N)   ! first use the false mean 12680.000
  FMT   =   '(A,4F12.4)'
  PRINT FMT," c vector  = ", c
  PRINT FMT," false mean c    = ", fmean
  PRINT FMT," residuals = ", c - fmean


  c = c + 12680.0            ! now recover the original data
  cmean = SUM(c) / REAL(N)
  PRINT FMT," c vector  = ", c
  PRINT FMT," raw mean c    = ", cmean
  PRINT FMT," residuals = ", c - cmean

END PROGRAM water_mean

::::::::::::::
pg11_6.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 260                 C++ and Fortran 90


PROGRAM muon_momentum

  REAL :: m = 105.0 
  REAL :: p(6) = (/1. , 20. , 50. , 100. , 200. , 500. /) 
  REAL :: beta , E1 , E2
  DO k = 1 , 6
     beta = p(k) / sqrt(m**2 + p(k)**2)
     E1 = m / sqrt(1.0 - beta**2)
     E2 = sqrt(p(k)**2 + m**2)
     PRINT '(5ES15.6)' , p(k) , beta , E1 , E2 , E1-E2
  ENDDO
END PROGRAM muon_momentum

::::::::::::::
pg11_8.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 251                 C++ and Fortran 90


PROGRAM Horner_poly

  REAL :: v, g , a(0:3)
  DATA a /2.000 , 4.142 , 3.492 , 6.670/

  v = 1.0
  g =  1.0 / Horner(a , 3 , v)
  PRINT * , v, g, a  
     
  v = 2.0
  g =  1.0 / Horner(a , 3 , v)
  PRINT * , v, g
  PRINT * ,  '  1.55' , 1.0 / Horner(a , 3 , 1.55)
  
END PROGRAM Horner_poly

REAL FUNCTION Horner(p,N,x)
  INTEGER :: k, N
  REAL    :: p(0:N), x, horn
  horn = 0.0
  DO k = N , 0 , -1
     horn = p(k) + horn*x
  ENDDO
  Horner = horn
END FUNCTION Horner




