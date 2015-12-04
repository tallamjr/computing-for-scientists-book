::::::::::::::
pg10_1.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 230                 C++ and Fortran 90


   MODULE vec                           ! This is the module file vec.f90
     
       TYPE vector                      ! define the data structure
         REAL :: x , y
       END TYPE vector
     
   CONTAINS
       FUNCTION scalar_product(a , b)
         TYPE(vector) :: a , b
         REAL :: scalar_product
         scalar_product = a%x*b%x + a%y*b%y
         RETURN
       END FUNCTION scalar_product

       SUBROUTINE rotate_vec(v , theta) ! using a  subroutine
         TYPE(vector) :: v
         REAL :: theta , temp_x
         temp_x = v%x                   ! save the x value
         v%x = v%x*cos(theta)    - v%y*sin(theta)
         v%y = temp_x*sin(theta) + v%y*cos(theta)
         RETURN
       END SUBROUTINE rotate_vec

   END MODULE vec


!! Barlow and Barnett, Computing for Scientists 1998
!! page 230                 C++ and Fortran 90

PROGRAM vectors

  USE vec
  TYPE(vector) venus , mercury
  
  venus%x = 0.0
  venus%y = 1.0811e8
  
  CALL rotate_vec(venus , 0.010)
  ! ...
  PRINT * , venus%x , venus%y
  ! ...

END PROGRAM vectors


::::::::::::::
pg10_2.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 230                 C++ and Fortran 90


   MODULE vec   !  This is the module file vec.f90
     
       TYPE vector   ! define the data structure
         REAL :: x , y
       END TYPE vector
     
   CONTAINS
       FUNCTION scalar_product(a , b)
         TYPE(vector) :: a , b
         REAL :: scalar_product
         scalar_product = a%x*b%x + a%y*b%y
         RETURN
       END FUNCTION scalar_product

       SUBROUTINE rotate_vec(v , theta) ! Fortran has subroutines too
         TYPE(vector) :: v
         REAL :: theta , temp_x
         temp_x = v%x                   ! save the x value
         v%x = v%x*cos(theta)    - v%y*sin(theta)
         v%y = temp_x*sin(theta) + v%y*cos(theta)
         RETURN
       END SUBROUTINE rotate_vec

   END MODULE vec


!! Barlow and Barnett, Computing for Scientists 1998
!! page 230                 C++ and Fortran 90

PROGRAM vectors

  USE vec
  TYPE(vector) venus , mercury
  
  venus%x = 0.0
  venus%y = 1.0811e8
  
  CALL rotate_vec(venus , 0.010)
  ! ...
  PRINT * , venus%x , venus%y
  ! ...

END PROGRAM vectors


::::::::::::::
pg10_6.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 237                 C++ and Fortran 90

!! fragment

TYPE vec2D
    REAL :: x , y
END TYPE vec2D
TYPE vec
    INTEGER :: N
    REAL :: DATA(N)
END TYPE vec

INTERFACE ASSIGNMENT(=)
 MODULE PROCEDURE vec2D_to_vec
END INTERFACE
! ...
 SUBROUTINE vec2_to_vec(v,v2)
 TYPE(vec) , INTENT = OUT :: v
 TYPE(vec2D) , INTENT = IN :: v2
   v%data(1) = v2%x
   v%data(2) = v2%y
 RETURN
 END

::::::::::::::
vec.f90
::::::::::::::

!! Barlow and Barnett, Computing for Scientists 1998
!! page 230                 C++ and Fortran 90


   MODULE vec   !  This is the module file vec.f90
     
       TYPE vector   ! define the data structure
         REAL :: x , y
       END TYPE vector
     
   CONTAINS
       FUNCTION scalar_product(a , b)
         TYPE(vector) a , b
         REAL :: scalar_product
         scalar_product = a%x*b%x + a%y*b%y
         RETURN
       END FUNCTION scalar_product

       SUBROUTINE rotate_vec(v , theta) ! Fortran has subroutines too                   TYPE(vector) v
         REAL :: theta , temp_x
         temp_x = v%x                   ! save the x value
         v%x = v%x*cos(theta) - v%y*sin(theta)
         v%y = temp_x*sin(theta) + v%y*cos(theta)
         RETURN
       END SUBROUTINE rotate_vec

   END MODULE vec
