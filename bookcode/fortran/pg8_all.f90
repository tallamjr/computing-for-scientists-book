::::::::::::::
pg8_1.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 169, 173 - 175      C++ and Fortran 90

PROGRAM format_examples

  INTEGER :: j = 345    , n = -776
  REAL    :: x = 1.123  , y = -7.2     , Q = 355. / 113. , z = 2.7818
  INTEGER :: start = -8 , finish = 789 , ios

  INTEGER :: ind(8)  = (/3 , 21 , 17 , 6 , 5 , 4 , 6 , 7/)
  REAL    :: arr(15) = (/(j , j=1,15)/) , array(3 , 5)
  REAL    :: val(3)  = (/111.61 , 123.44 , 187.98/)
  REAL    :: err(3)  = (/  0.47 ,   0.89 ,   0.68/)
  

  CHARACTER  :: fmt1*30 , fmt*30

  fmt1 = '("Values " , I4 , F9.4 , F8.3)'
  PRINT fmt1 , j , x , y
  fmt = fmt1

  PRINT '(" Green world")'             
  PRINT '(" Answer " , F9.3)', x
  PRINT '(" Answers " , I4 , F9.4 , F9.3)' , j , x , y
  PRINT '(" For " , I4 , " hits " , / ,&
       & " Q = " , F9.2)' , n , Q

100 FORMAT(2I9)
  PRINT * , start , finish             ! use default format
  PRINT '(2I10)' , start , finish      ! format is specified in the string
  PRINT 100 , start , finish           ! format is specified at  label 100

  WRITE (6 , * ) start , finish        ! use default format
  WRITE (6 , '(2I10)') start , finish  ! format is specified in the string
  WRITE (6 , 100) start , finish       ! format is specified at  label 100
  
  WRITE (14 , fmt, IOSTAT=ios) x , y , z 
  IF( ios /=0 ) CALL WRITE_ERROR(ios)  ! deal with the error in some way
  PRINT * , 'ios = ' , ios

  WRITE(14 , fmt , ERR=999)  x , y , z ! a clumsier method than IOSTAT  
!      RETURN
999 PRINT * , ' Output Error'
!      STOP

!  READ(12 , * , ERR=999) x            ! from unit 12
  

  WRITE (6 , '(8I5)')   (ind(j) , j=1,8)


  array = RESHAPE(SOURCE = arr , SHAPE = (/3 , 5/))
  PRINT * , array
  PRINT * , transpose(array)
  WRITE (6 , '(" " , 5F8.3)') ((array(j , k) , k=1,5) , j=1,3)
  n = 3
  WRITE (6 , '(1X , I4 , F14.2 , " +- " , F6.2)') (j , val(j) , err(j) , j=1,n)
  STOP
END PROGRAM format_examples

SUBROUTINE WRITE_ERROR(k)
  INTEGER :: k
  PRINT * , k
  RETURN
END SUBROUTINE WRITE_ERROR

::::::::::::::
pg8_2.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 177                 C++ and Fortran 90


! decode a  line of data of the form    text = value

PROGRAM decode_string

  REAL      ::  val
  CHARACTER ::  line*80
  INTEGER   :: k

 ! READ (5 , *)  line                   ! or READ * , line
  line = 'energy = 33.654'
  PRINT * , line !! , LENGTH(line)
  k = INDEX(line , '=')                 ! find equals sign
  IF (k > 0 ) THEN 
     READ(line(k+1:) , '(F10.3)') val   ! read value from array      
     PRINT * , k , line , val
  ENDIF

END PROGRAM decode_string

::::::::::::::
pg8_7.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 185                 C++ and Fortran 90

PROGRAM primes_fort

!! note chaged values for ktest, nprimes and inner DO LOOP index

INTEGER :: i , j , ktest = 2 ,  nprimes = 1       ! start with 2nd prime = 3
INTEGER :: nrows , ntodo , primes(1 : 201) = 2    ! initialise array
LOGICAL :: prime

PRINT * , ' How many rows of primes (1-20)?'
READ  * , nrows
ntodo = 10*nrows
IF(ntodo > 200) STOP 'too many numbers for array size'
outer:    DO i=1 , ntodo
             prime = .FALSE.
middle:      DO WHILE( .NOT. prime)
                ktest = ktest+1
inner:          DO j = 1 ,  nprimes
                   IF(MOD(ktest , primes(j)) == 0) cycle middle
                ENDDO inner
                prime = .TRUE.
             ENDDO middle
             nprimes = nprimes+1
             primes(nprimes) = ktest
          ENDDO outer          
     PRINT 100
100       FORMAT(1X , 57('='))
     PRINT '(10I5 , I8)' , ((primes(10*(i-1)+j) , j=1,10) , 10*i , i=1,nrows)  
     PRINT 100

     STOP ' formatted primes all done'
END  PROGRAM primes_fort

::::::::::::::
pg8_8.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 189                 C++ and Fortran 90


PROGRAM FILES

  INTEGER   :: MYUNIT
  CHARACTER :: dfile*30

! all these statements should be checked with IOSTAT 
! and appropriate actions taken else you will get run-time errors
 
  OPEN(22 , FILE='data.01' , ACTION='READ')     ! Open existing file for input as unit 22
  OPEN(23 , FILE='results.01' , ACTION='WRITE') ! Open a file for output 
  OPEN(FILE='log' , ACTION='WRITE' , POSITION='APPEND' , UNIT=24)
  MYUNIT = 25
  DFILE = 'dictionary.dat'
  OPEN(MYUNIT , FILE=DFILE , ACTION='READWRITE') 

END PROGRAM FILES


::::::::::::::
pg8_12.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 190                 C++ and Fortran 90


PROGRAM trapping

  INTEGER :: J
  OPEN(21 , FILE="old.data" , ACTION='READ' , IOSTAT=J)
  IF(j /= 0) THEN
     PRINT * , ' Failed to open OLD.DATA file'
     PRINT * , ' Error number ' , J , " Consult Manual!"
     STOP
  ENDIF
  OPEN(22 , FILE="new.data" , ACTION='WRITE' , ERR=999 , IOSTAT=J)
  STOP
999 PRINT * , ' File opening error ', J
  STOP
END PROGRAM trapping

::::::::::::::
pg8_15.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 195                 C++ and Fortran 90


PROGRAM r_access

  INTEGER   :: pages
  CHARACTER :: name*30, title*100
  OPEN(10, FILE='cat',  ACCESS='DIRECT', RECL=124)
! be very sure to test for success using IOSTAT 

  READ(10,'(I4 , A20 , A100)',REC=100)   pages ,  name ,  title


END PROGRAM r_access
