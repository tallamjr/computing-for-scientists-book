::::::::::::::
pg4_1.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 79                  C++ and Fortran 90

LOGICAL :: file_open = .FALSE.
    OPEN(1 , file = 'results.dat')        ! open the file on channel 1
    file_open = .TRUE. ! I/O status = .TRUE.
          ! ...		                  ! read/write using the file
    IF (file_open) THEN
      CLOSE(1)		                  ! close the open file on channel 1
      file_open=.FALSE.
    ENDIF

END

::::::::::::::
pg4_2.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 79                  C++ and Fortran 90

LOGICAL :: DEBUG=.TRUE.
!        ...
INTEGER :: n_data = 5
REAL    :: x(5) = (/1, 2, 3, 4, 5/)
REAL    :: slope = 2.5 , const = -1.
	DO i = 1 , n_data
           f = slope*x(i) + const
           IF(DEBUG) PRINT * , i , x(i) , f
           ! ...
	ENDDO

END

::::::::::::::
pg4_3.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 85                  C++ and Fortran 90

PROGRAM broke

REAL    :: balance = -500.00
LOGICAL :: arrangement = .FALSE.

  IF (balance < 0.0) THEN
         ! outer condition
      PRINT * , ' Overdraft'
      IF( .NOT. arrangement ) THEN
             ! inner condition
          PRINT * , ' Not permitted!'     
      ENDIF
  ENDIF

END PROGRAM broke

::::::::::::::
pg4_4.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 87                  C++ and Fortran 90

PROGRAM logical_edifice

LOGICAL :: volts_on = .true. , &
             readout_working = .true. , &
             data_present    = .false., &
             data_valid      = .true.


IF (volts_on) THEN
                   ! ... ask for readout condition
    IF (readout_working) THEN
                   ! ... try and take data
        IF (data_present) THEN
                   ! ... check data not rubbish
            IF (data_valid) THEN 
                   ! ... analyse data

            ENDIF

        ELSE

            PRINT * , 'error!'   
        ENDIF
    ENDIF
ENDIF

 VOLTAGE:    IF (volts_on) THEN
 READOUT:        IF (readout_working) THEN
 PRESENT:            IF (data_present) THEN
 VALID:                    IF (data_valid) THEN
                                      ! ... analyse data
                          ENDIF VALID
                     ELSE PRESENT
                            PRINT * , 'Error: no data present'
                     ENDIF PRESENT
                 ENDIF READOUT
             ENDIF VOLTAGE


END PROGRAM logical_edifice

::::::::::::::
pg4_5.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 108                  C++ and Fortran 90

part listing

SELECT CASE(option)

   CASE('A')
         CALL analyse

   CASE('S')
         CALL store

   CASE('Q') 
         STOP ' Q entered'
   CASE('E')
         STOP ' E entered'
   CASE DEFAULT
         PRINT * , 'Invalid option, use A S Q E' 
END SELECT

::::::::::::::
pg4_6.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 92                  C++ and Fortran 90

PROGRAM douze

  INTEGER :: k

  DO k=1 , 12
      PRINT * , k , ' men went to mow'
  END DO 

END PROGRAM douze

::::::::::::::
pg4_7.f90
::::::::::::::

!!  Barlow and Barnett, Computing for Scientists 1998
!!  page 94                  C++ and Fortran 90


!! listing fragment

ROW: DO i=1 , n

COLUMN: DO j=1 , n
           c(i , j) = 0.0
SUM:       DO  k=1 , n
             c(i , j) = c(i , j) + a(i , k) * b(k , j)
            ENDDO SUM
         ENDDO COLUMN
      ENDDO ROW


::::::::::::::
pg4_10.f90
::::::::::::::

!!  Barlow and Barnett, Computing for Scientists 1998
!!  page 98                  C++ and Fortran 90

!! listing fragment

SUBROUTINE quod(a , b , c)
  REAL :: a , b , c , x1 , x2 , test , disc
     test = b*b - 4.0*a*c
     IF (test < 0.0)        GOTO 10
     disc = SQRT(test)
20   x1 = -(b + SIGN(disc,b)) / (2.0*a)
     x2 =  c/x1
     PRINT * , ' Roots' , x1 , x2
     RETURN
10   PRINT * , ' Complex Roots'
                            GOTO 20
END SUBROUTINE quod


SUBROUTINE quad(a , b , c)
  REAL :: a , b , c , x1 , x2 , test , disc    
  test = b*b - 4.0*a*c
  IF (test < 0.0) THEN
     PRINT * , ' Complex Roots'
  ELSE
     disc = SQRT(test)
  ENDIF
  x1 = -(b + SIGN(disc,b)) / (2.0*a)
  x2 =  c/x1
  PRINT * , ' Roots', x1, x2
  RETURN
END SUBROUTINE quad

::::::::::::::
pg4_11.f90
::::::::::::::

!!  Barlow and Barnett, Computing for Scientists 1998
!!  page 99                  C++ and Fortran 90


!! listing fragment

SUBROUTINE make_clean_cup(cup_state)
  INTEGER     ::  cup_state
  INTEGER     ::  cup_full , cup_dirty , cup_clean   
  PARAMETER(cup_full=1 , cup_dirty=2 , cup_clean=3)   
  DO 
     SELECT CASE(cup_state)
     CASE(cup_clean)
        RETURN
     CASE(cup_dirty)
        CALL wash_cup(cup_state)
     CASE(cup_full)
        CALL empty_cup(cup_state)
     END SELECT
  END DO
END SUBROUTINE make_clean_cup

::::::::::::::
pg4_13.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 102                  C++ and Fortran 90

PROGRAM choices

  INTEGER :: i 
 
  i = -999
  DO WHILE (i<1 .OR. i>10)
     PRINT * , 'Type a number, 1 to 10'
     READ  *, i
  ENDDO


  DO
     ! infinite  loop
     PRINT * , 'Enter a number, 1 to 10'
     READ  * , i
     IF (i>=1 .AND. i<=10) EXIT
     !  failure condition
     PRINT * , ' Between 1 and 10!'
  ENDDO


  PRINT * , ' Guess a  number, 1 to 10'
  READ  * , i
  DO WHILE(i<1 .OR. i>10)
     PRINT * , ' Need 1 to 10! Try again!'
     READ  * , i
  END DO

END PROGRAM choices

