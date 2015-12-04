::::::::::::::
pg2_0.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 32                  C++ and Fortran 90

PROGRAM variables

  REAL     :: x_data
  REAL     :: height , area , width
  INTEGER  :: number, n_row , m_col


  REAL     :: Planck = 6.60E-34
  REAL     :: fx = 32.71 , dx = -0.038
  INTEGER  :: index = 11 , beast = 666


  INTEGER  ::  i = 10
  INTEGER  ::  range = 101*3 - 7
! INTEGER  ::  j = i + 5 ! illegal in F90
  INTEGER , PARAMETER :: size=10
! INTEGER  ::  j = size + 5  !  OK


  INTEGER  :: kk
  kk = 33
! REAL     :: z ! illegal after first executable


END PROGRAM variables

::::::::::::::
pg2_1.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 33                  C++ and Fortran 90


PROGRAM typos

  REAL    :: x1 = 1.0
  INTEGER :: i , i_max = 99    
     ! ...
  y = SIN(xl) 
  DO i = 1 , max_i
     ! ...
  ENDDO


END PROGRAM typos

::::::::::::::
pg2_2.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 33                  C++ and Fortran 90

PROGRAM find_typos

  IMPLICIT NONE

  REAL    :: x1 = 1.0
  INTEGER :: i , i_max = 99   
     ! ...
  y = SIN(xl) 
  DO i = 1 , max_i
     ! ...
  ENDDO

END PROGRAM find_typos

::::::::::::::
pg2_3.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 33                  C++ and Fortran 90

PROGRAM param

  INTEGER , PARAMETER :: m = 100 ! m is a parameter, value 100
  INTEGER :: parameter, n =  10  ! "n" and "parameter" are variables

  !  "n " is initially 10, "parameter" is undefined
  !  Here the name choice, parameter, is confusing and unwise, but legal
  
  INTEGER :: ci ,aj ,zk
  REAL    :: pqr = 355. / 113. 
  REAL    :: zzz
  LOGICAL : bool

  zzz = pqr 
  bool = .true.
  ci = 1; aj = 2; zk = 3;     ! several statements to a line
  parameter = 5
  PRINT * , parameter , n , m , pqr , m + 1
  n = m + 1
  PRINT * , pqr-zzz , zzz , n , bool

END PROGRAM param

::::::::::::::
pg2_5.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 35                  C++ and Fortran 90

PROGRAM static

  CALL static_int
  CALL static_int
  CALL static_int
  CALL static_int

END PROGRAM static


SUBROUTINE static_int
   INTEGER :: c1
   INTEGER , SAVE   :: c2 = 0 ! compiles but c1 also is saved!!
!  INTEGER , STATIC :: c2 = 0
     c1 = 0
     c1 = c1 + 1
     c2 = c2 + 1
     PRINT * , ' counters', c1 , c2     
   RETURN
END SUBROUTINE static_int

::::::::::::::
pg2_6.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 35                  C++ and Fortran 90

PROGRAM falloc

  REAL , DIMENSION (:) , ALLOCATABLE :: zdata  
  READ  * , n           ! get size         
  ALLOCATE (zdata(1:n)) ! allocate
  
  READ  * , (zdata(i) , i = 1 , n)
  PRINT * , zdata
  
  DEALLOCATE(zdata)
  PRINT * , zdata

END PROGRAM falloc


::::::::::::::
pg2_10.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 41                  C++ and Fortran 90

PROGRAM assign
  
  INTEGER :: jmax = 2
  REAL    :: xmax
  REAL    :: pi , r , area , circle , side 
  INTEGER :: jflag , quincunx
     ! ...
  xmax = REAL(jmax)     ! function 
  PRINT *, jmax, xmax

  PRINT '(I4)' , INT(2.4D0 / 0.1D0) 
  PRINT '(I4)' , INT(2.1 / 0.1)

  PRINT '(2I4)' , INT(2.4D0 / 0.1D0) , NINT(2.4D0 / 0.1D0)
  PRINT '(2I4)' , INT(2.1 / 0.1) ,     NINT(2.1 / 0.1)

  pi = 3.14 ; r = 2. ; area = 4.84
  jflag = 2
  quincunx = 2**15 - 1
  circle = 2.0 * pi * r
  side  = SQRT(area)

  PRINT * , jflag, quincunx, circle, side

END PROGRAM assign

::::::::::::::
pg2_12.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 54                  C++ and Fortran 90

PROGRAM log_factorial

  IMPLICIT NONE
  INTEGER :: i , n , int_prod
  REAL    :: xn , r , r2 , real_prod , PI
  REAL    :: fac1 , fac2 , fac3 , logfac

  PI = 4.d0*ATAN(1.0d0)
  DO
     PRINT * , ' Integer factorial 1-10000'
     READ  * , n; IF (n < 1) STOP ' n < 1 '
     xn = REAL(n); r = 1.0/xn; r2 = r*r

     IF (n < 13) THEN
        int_prod = 1
        DO i = 1 , n
           int_prod = int_prod * i
        ENDDO
        logfac =  log(REAL(int_prod))

     ELSEIF (n < 35) THEN
        real_prod = 1.0
        DO i = 1 , n
           real_prod = real_prod*REAL(i)
        ENDDO
        logfac =  log(real_prod)

     ELSE
        logfac = 0.0
        DO i = 1 , n
           logfac =  logfac +  log(REAL(i))
        ENDDO
     ENDIF

     fac1 = xn*log(xn) - xn
     fac2 = fac1 + 0.5*(log(2.0*PI*xn))
     fac3 = fac2 + (r/12.) * (1. - r2*(1./30.&
            - r2*(1./105. - r2*(1./140. - r2/99.))))
     PRINT * , ' n ,  log n! , & approximations'
     PRINT * , n ,  logfac , fac1 , fac2 , fac3
  ENDDO

END PROGRAM log_factorial
