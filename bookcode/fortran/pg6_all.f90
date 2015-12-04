::::::::::::::
pg6_2.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 129                  C++ and Fortran 90


PROGRAM charint
  ! Program to show conversion between integers and printable characters
  ! in the F90 ASCII character set
  INTEGER   :: int
  CHARACTER :: char*1 , fmt*40 , label*50
  label = '(6(1X , A))'
  PRINT label , 'Code (dec)' , 'Code (hex)' , 'Symbol' , &
               &'Code (dec)' , 'Code (hex)' , 'Symbol' 
  fmt = '(2(1X , I8 , Z11 , 7X , A1 , 1X ))'
  DO  int = 32 , 127
     char = ACHAR(int)
     PRINT fmt , int , int , char ,  int+32 , int+32 , ACHAR(int+32)
  END DO
  STOP
END PROGRAM charint

::::::::::::::
pg6_3.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 133                  C++ and Fortran 90

PROGRAM hi_there
  PRINT * , ' hello, world'
  WRITE(* , *) ' hello, world'


  PRINT * , ' hello hello hello, &
       & you big wide wonderful world'
  WRITE(* , *)' hello hello hello, &
       & you big wide wonderful world'

END PROGRAM hi_there

::::::::::::::
pg6_4.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 135                  C++ and Fortran 90

PROGRAM what
  LOGICAL :: log , query
  log = query('  give me a sign => ')
  PRINT * , log
END

LOGICAL FUNCTION query(q)
  ! Library function that prints a query
  ! obtains a yes-no answer
  ! and returns .TRUE. or .FALSE.

  CHARACTER :: q*(*) , reply*20
  DO WHILE (.TRUE.)
     PRINT * , q
     READ * , reply
     SELECT  CASE(reply)
       CASE('Y'); query = .TRUE. 
       CASE('y'); query = .TRUE.
       CASE('N'); query = .FALSE.
       CASE('n'); query = .FALSE.
       CASE DEFAULT 
        PRINT * , ' Sorry?' ,&
             &' Please reply Y or N'
       CYCLE
     END SELECT
     RETURN
  END DO
END FUNCTION query

::::::::::::::
pg6_5.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 137                  C++ and Fortran 90

PROGRAM id
  
  CHARACTER :: forename*10 = 'Alexander' , &
       surname*10 = 'Borodin' , fullname*20
  fullname = forename//surname
  PRINT * , fullname

END PROGRAM id

::::::::::::::
pg6_6.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 138                  C++ and Fortran 90

PROGRAM mess

  CHARACTER , dimension(6)  :: symbil*2=(/'H ' , 'He' , 'Li' , 'Be' , 'B ' , 'C '/)
  CHARACTER  :: symbol(6)*2 = (/'H ' , 'He' , 'Li' , 'Be' , 'B ' , 'C '/)

  CHARACTER warning*30, message*30
  warning = 'Negative Root'
  message = warning
  PRINT * , message


  PRINT * , symbol
  PRINT * , symbol(1:3) , '   ' , symbol(2) , '   ' , symbol(3)(2:2)
  PRINT * , symbil
  PRINT * , symbil(1:3) , '   ' , symbil(2) , '   ' , symbil(3)(2:2)

END PROGRAM mess

::::::::::::::
pg6_9.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 145-150                C++ and Fortran 90

PROGRAM Molecular_Weight

  IMPLICIT NONE
  INTEGER , PARAMETER :: max_el = 92
  REAL      :: AtWt(max_el+1)
  CHARACTER :: symbol(max_el+1)*2
  INTEGER   ::  xnpt
  REAL      :: molwt
  INTEGER   :: jstat = 0
  CHARACTER :: formula*100
  CALL read_data_file
  DO
     !   Get formula and compute molecular weight
     PRINT * , ' Please enter formula'
     READ  * ,  formula
     PRINT * ,  formula
     molwt = value_of(formula)
     PRINT '(A,F15.4)' , ' Molecular Weight is', molwt
  ENDDO
STOP ' normal exit from MolWt'
 
CONTAINS

  SUBROUTINE read_data_file
    !integer  :: xnpt ! correctly fails ... very instructive
    OPEN(UNIT = 1 , FILE = 'pt.dat')
    xnpt = 1
    DO WHILE(jstat >= 0)
       READ(1 , '(A2 , F15.3)' , IOSTAT=jstat) symbol(xnpt) , AtWt(xnpt)
       IF(xnpt>=max_el) exit
       xnpt = xnpt + 1
    END DO
    PRINT * , xnpt , ' elements read in'
    CLOSE(UNIT = 1)
    RETURN
  END SUBROUTINE read_data_file

  REAL RECURSIVE FUNCTION value_of(form) RESULT (val)
    CHARACTER :: form*(*)
    INTEGER   ::  fcount  
    REAL      :: fhead 
    IF(LEN_TRIM(form) .EQ. 0) THEN
       val = 0.0
       RETURN
    ENDIF

    fhead = val_head(form)
    fcount = val_count(form)
    val = fhead * fcount + value_of(form)
    RETURN
  END FUNCTION value_of

  REAL RECURSIVE FUNCTION val_head(form) RESULT(val)
    CHARACTER :: form*(*)
    IF(form(1:1) == '(') THEN
       val = val_group(form)
    ELSE
       val = val_element(form)
    ENDIF
    RETURN
  END FUNCTION val_head

  REAL RECURSIVE FUNCTION val_element(form) RESULT(val)
    INTEGER    :: i , j
    CHARACTER  :: form*(*)
    CHARACTER  :: work*2
    i = 1
    IF(form(2:2)>='a' .AND. form(2:2)<='z')  i = 2
    work = form(1:i)
    DO j = 1 , xnpt
       IF(work==symbol(j)) THEN
          val = AtWt(j)
          form = form(i+1:)
          RETURN
       ENDIF
    ENDDO
    PRINT * , 'Unknown Element ', form(1:i)
    STOP ' a serious error found here'
  END FUNCTION  val_element

  INTEGER FUNCTION val_count(form)
    INTEGER   :: j
    CHARACTER :: form*(*)
    val_count = 0
    DO
       j=INDEX('0123456789' , form(1:1))
       IF (j == 0) THEN
          IF (val_count == 0) val_count=1
          RETURN
       ENDIF
       form = form(2:)
       val_count = 10*val_count+j-1
    ENDDO
  END FUNCTION val_count

  REAL RECURSIVE FUNCTION val_group(form) RESULT(val)
    CHARACTER :: form*(*)
    CHARACTER :: work*100
    INTEGER   :: i , j
    j = 0
    DO i = 2 , LEN(form)
       
       IF( form(i:i)=='(' ) j = j+1
       IF( form(i:i)==')' ) j = j-1
       IF(j < 0) THEN
          work = form(2:i-1)
          form = form(i+1:)
          val = value_of(work)
          RETURN
       ENDIF
    ENDDO
    STOP ' Missing right bracket'
  END FUNCTION val_group

END PROGRAM Molecular_Weight


::::::::::::::
pt.dat
::::::::::::::
H    1.0079
He   4.0026
Li    6.941
C    12.011
O    15.9994
F    18.9984
Si   28.0855
S    32.06
Fe   55.847
Cu   63.546
I   126.905
U   238.029


::::::::::::::
char.dat
::::::::::::::
Li
LiH
HI
SiH4
UF6
H2O
H2O2
Fe2(SO4)3
CuSO4(H2O)5
C6H6
C2H5(OH)
H(CH2)8H
C60
LI
Si(H4

