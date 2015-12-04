::::::::::::::
pg3_7.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 72 - 73                  C++ and Fortran 90

PROGRAM initialise

  ! corrected from the text
  REAL :: a(1:8)        ! equivalent to a(8)
  REAL :: b(0:7)        ! sets up  8 locations b(0) to b(7)  like C++
  REAL :: c(13:20)      ! sets up  8 locations c(13) , c(14) ... c(20)
  REAL :: d(-10:-3)     ! sets up  8 locations d(-10)...d(-3)

  
 !PARAMETER :: (N=100 , J=3)  ! incorrect statement in text

  INTEGER :: N , J
  PARAMETER    (N=100 , J=3)  ! the PARAMETER statement, or see p34

  REAL :: x_value(0 : N-1) , y_value(0 : N-1) , error(0 : N-1)
  ! three 100-element arrays , (0,99)
  REAL :: freq(-N/2 : N/2) , m_state(-J:J) , VEC(0 : 2*J-1)  ! 3 more arrays
  CHARACTER  , DIMENSION(N/2) :: address*20 , name*20


  INTEGER :: AA(3) = (/ 11 , 13 , 12 /)                 ! set to 11, 13 and 12
  INTEGER :: BB(3) =  7   !(/ 3*7 /)     nb text error  ! set to 7, 7, 7
  INTEGER :: CC(3) = (/ (I , I=1,3) /)                  ! set to 1, 2, 3
  INTEGER :: DD(3) = (/ (I , I=2,8,3) /)                ! set to 2, 5, 8
  INTEGER :: EE(6) = (/ (2*I-1 , I=1,3) , 0, 0, 0 /)    ! set to 1, 3, 5, 0, 0, 0
                                              ! nb text error

  REAL    :: values(-100 : 100)
  INTEGER :: jj
  READ * , jj !  range -100 to 100
  READ * , values(jj) 
  
  PRINT * , a, b, c, d, x_value, y_value, error
  PRINT * , AA, BB, CC, DD, EE
  PRINT * , address, name, freq, vec, m_state
  ! note the results of printing out uninitialised sections of memory and beware !!

END PROGRAM initialise






