::::::::::::::
pg9_1.f90
::::::::::::::
!! Barlow and Barnett, Computing for Scientists 1998
!! page 198                 C++ and Fortran 90


PROGRAM FP_numbers

  ! 1/3+2/3 is not 1    and    0.1 is not 1/10
  
  REAL      :: third = 1.0 / 3.0 , one = 1.0
  REAL      :: twothirds = 2.0 / 3.0
  CHARACTER :: fmt*11 = '(A , E12.7)'
  PRINT fmt , ' 1./3. + 2./3. - 1. = ' , third + twothirds - one
  IF( 0.1 /= one/10.0 )  PRINT * , &
       ' 0.1 - 1.0/10. = ' , 0.1 - one/10.0

END PROGRAM FP_numbers

::::::::::::::
pg9_2.f90
::::::::::::::
!! Barlow and Barnett, Computing for Scientists 1998
!! page 198                 C++ and Fortran 90


PROGRAM non_associate

  ! to show (x+y)+z /= x+(y+z)
  
  REAL :: x = 1e8 , y = -1e8 , z = 1.0
  REAL :: xy , yz
  xy = x + y; yz = y + z                    !store result
  PRINT * , ' xy , yz , xy + z , x + yz ,'&
       & , ' supposedly equal, not 1. and 0.'
  PRINT * , xy , yz , xy + z , x + yz

END  PROGRAM non_associate
::::::::::::::
pg9_3.f90
::::::::::::::
!! Barlow and Barnett, Computing for Scientists 1998
!! page 199                 C++ and Fortran 90


PROGRAM epsilon
  
  REAL    :: eps , one=1.0 , oneeps
  INTEGER :: k
  LOGICAL :: testeps
  REAL    :: f, more, less, space
 
  eps = 2.0**(-14)    ! as a start
  DO k = 1 , 16
     eps     = eps / 2.0
     oneeps  = one + eps
     testeps  = (oneeps /= one)
     PRINT * , ' one+eps , eps ,' , & 
          ' testeps ', one+eps , eps , testeps
  ENDDO

! illustrates NEAREST page 200

  f = 123.56
  more = NEAREST(123.56 , +1.)
  less = NEAREST(123.56 , -1.)
  space= SPACING(123.56)

  PRINT * , more , less , space
  PRINT * , more - f  , f - less , space
  PRINT '(3F15.8)' , more , less , space
  PRINT '(3F15.8)' , more - less , space , 2.0*space
  PRINT '(3F15.8)' , more - space , less + space , more - less - 2.0*space

  STOP
END PROGRAM epsilon
::::::::::::::
pg9_4.f90
::::::::::::::
!! Barlow and Barnett, Computing for Scientists 1998
!! page 205                 C++ and Fortran 90

PROGRAM underflow

  REAL :: h , m , lam , q , E , h2 , den

  h  = 6.626e-34                          ! Planck
  m  = 1.675e-27                          ! neutron mass
  lam = 5.0e-6                            ! wavelength
  q = 1.602e-19                           ! electron charge
  h2 = h * h ; den = 2.0*m*lam**2 
  E = h2 / den
  PRINT '(A , 2ES15.6)' , ' Energy for &
       &neutron diffraction in J and eV ', E , E/q

END PROGRAM underflow
::::::::::::::
pg9_5.f90
::::::::::::::
!! Barlow and Barnett, Computing for Scientists 1998
!! page 206                 C++ and Fortran 90


PROGRAM sensible_units

  REAL :: hc , mc2 , lam , E

  hc  = 1239.7                    ! eV nm
  mc2 = 939.6e6                   ! eV
  lam = 5000.                     ! nm

  E = hc**2 / (2.0 * mc2 * lam**2)
  PRINT '(A , ES15.6)' ,' Energy in  eV '  , E
  PRINT * , E

END PROGRAM sensible_units
::::::::::::::
pg9_6.f90
::::::::::::::
!! Barlow and Barnett, Computing for Scientists 1998
!! page 212                 C++ and Fortran 90

  REAL FUNCTION mean(n , old , y)
    INTEGER :: n
    REAL    :: y , old
    mean = old + (y-old) / REAL(n)   
  END FUNCTION mean

  !=== example of its use :

PROGRAM meaning

  REAL    :: m = 0.0 , mean , &
       & speed(5) = (/1. , 2.3 , 4.1 , 5. , 6./) 
  INTEGER :: i
  DO i=1 , 5                   ! averages speed
     m = mean(i , m , speed(i))
  ENDDO
  PRINT * , ' mean value = ' , m

END PROGRAM meaning
::::::::::::::
pg9_7.f90
::::::::::::::
!! Barlow and Barnett, Computing for Scientists 1998
!! page 213                 C++ and Fortran 90

PROGRAM lose_digits

  REAL :: a , b , c , d , x , poly

  x = 1.01
  a = x**4;           b = 4.0*x**3
  c = 6.0*x**2;       d = 4.0*x
  poly = a - b + c - d + 1.0
  PRINT * , ' polynomial ' , poly

END PROGRAM lose_digits
::::::::::::::
pg9_8.f90
::::::::::::::
!! Barlow and Barnett, Computing for Scientists 1998
!! page 217                 C++ and Fortran 90


PROGRAM SUM_4

  ! Sums the inverse 4-th powers of 
  ! the natural numbers up to ktot
  ! 1/1**4 + 1/2**4 + 1/3**4 ...

  REAL(KIND=2)  :: sum , pi_4
  REAL(KIND=2)  :: one=1.d0
  CHARACTER     :: fmt*9
  INTEGER       :: k , ktot
  pi_4 = (4.d0 * ATAN(one))**4 / 90.d0
  fmt = '(2F20.15)'
  INF_LOOP: DO
     sum = 0.d0
     PRINT * , ' ktot=sum of <= 1000000'
     READ  * , ktot
     IF( ktot < 1 ) EXIT INF_LOOP
     DO k = 1 , ktot
        sum = sum + one / REAL(k)**4
     END DO
     PRINT fmt , sum , pi_4 - sum
  END DO INF_LOOP

  STOP 'SUM_4 concluded'

END PROGRAM SUM_4

::::::::::::::
pg9_9.f90
::::::::::::::
!! Barlow and Barnett, Computing for Scientists 1998
!! page 223                 C++ and Fortran 90

PROGRAM LS_fit_poly

  IMPLICIT NONE

  !  First construct the normal matrix = k x k from A = N x k
  !  part of programs to solve least-squares polynomial fits to data
  !  N = number of data points , k-1 = polynomial order  
  !  y = data at x

  INTEGER :: i , j , k , N
  PARAMETER(k=3 , N=8)     ! the user could read these in before allocation
  REAL(KIND=2) , DIMENSION(: , :) , ALLOCATABLE :: A , Nmat , L
  REAL(KIND=2) , DIMENSION(:) ,     ALLOCATABLE :: x, y, rhs, p, q 
  CHARACTER :: fmt*20
  LOGICAL   :: details = .FALSE.
  ALLOCATE ( A(N,k) , Nmat(k,k), rhs(k) , x(N ) , y(N))
   
  x = (/40., 80., 120., 160., 200., 240., 280., 320. /)    !==thermocouple deg C
  y = (/0.38, 0.64, 0.84, 0.96, 0.98, 0.93, 0.80, 0.61/)   !==thermocouple voltage
  fmt = '(3f20.4)'
  x = x / 100.0      ! scale the temperature vector
  
  A(: , 1) = 1.0;  A(: , 2) = x;  A(: , 3) = x*x        ! build up A by columns
  
  IF (details) THEN
     PRINT fmt , A(:,1); PRINT * , '/A(:,1)'
     PRINT fmt , A ;     PRINT * , '/A '
  ENDIF

  Nmat = MATMUL(TRANSPOSE(A) , A)
  rhs  = MATMUL(TRANSPOSE(A) , y)

  IF (details) THEN
     PRINT fmt , Nmat;   PRINT * , '/Nmat '
     PRINT fmt , rhs;    PRINT * , '/rhs '
  ENDIF

  ! ...
  !  Next part of program to  solve least-squares polynomial fits to data
  !  Form Cholesky lower triangle matrix  L from normal matrix V = A'A 

  ALLOCATE(  L(k , k) );    L = 0.0      ! essential to zero the new array
  IF (details) THEN
     PRINT '(A,/9E12.4)' , 'L= 0.0' , L
  ENDIF
  DO i=1,k
     L(i,i) = SQRT(Nmat(i,i) - DOT_PRODUCT(L(i , 1:i-1) , L(i , 1:i-1)))
     L( i+1:k , i) = (Nmat(i , i+1:k) - MATMUL(L(i+1:k , 1:i-1) , L(i , 1:i-1)))
     L(i+1:k ,i) = L(i+1:k , i) / L(i,i)
       IF (details) THEN
          PRINT fmt , TRANSPOSE(L); PRINT * , " "
       ENDIF
  ENDDO
  IF (details) THEN
     PRINT * , " /Press L"; PRINT fmt , TRANSPOSE(L)
  ENDIF


  ALLOCATE( q(k ) ) ; q = 0.0      ! solve for q using  Lq = rhs
  IF (details) PRINT * , "1"
  DO j=1,k
     q(j)=( rhs(j) - DOT_PRODUCT(L(j , 1:j-1), q(1:j-1) )  )/ L(j,j)
  ENDDO
  IF (details) THEN
     PRINT fmt , q; PRINT * , '/q '
  ENDIF

  ALLOCATE( p(k ) ); p = 0.0        ! solve for p using  L'p = q
  IF (details) PRINT * , "2"
  DO j = k , 1 , -1
     p(j)=( q(j) - DOT_PRODUCT(L(J+1:k , j), p(j+1:k) )  )/ L(j,j)
  ENDDO
  IF (details) THEN
     PRINT fmt, p; PRINT * , '/p'
  ENDIF

  PRINT * , ' Fit to the x , y data vectors '
  PRINT * , '       x :      ' , ' y :'
  PRINT '(1X , F10.2 , F10.3)' , ( x(j) , y(j) ,j=1,N )
  PRINT * , ' solution to y = a + bx + cx*x is ' 
  PRINT '(3(A , F12.5/))' , ' a = ',  p(1)  , ' b = ' , p(2) ,  ' c = ' , p(3)
 
  DEALLOCATE( A , Nmat ,   L , q )
 
  !...

END PROGRAM LS_fit_poly
