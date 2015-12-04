::::::::::::::
pg7_1.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 154 - 155             C++ and Fortran 90

// does not yet compile

#include <iostream.h>

main()
{
  float*  pointx;          // pointer to float
  int*    pointj;          // pointer to integer
  shape*  pointsh;         // pointer to a structure defined earlier
  
  
  float   *pointX;         // pointer to float
  int     *pointJ;         // pointer to integer
  shape   *pointSH;        // pointer to a structure defined earlier
  
  
  float *pointp , *pointq; // two pointers to float
  float *pointa ,  pointb; // makes pointb a float itself, not a pointer
  
  int i = 100;
  int *p;                  // p is declared as pointer-to-int
  p = &i; 
  cout << *p << endl;
  x = *p + y + 7;
  *p = 200;                // sets i  to 200

  return 0;
}

::::::::::::::
pg7_2.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 156                  C++ and Fortran 90


#include <iostream.h>

main()
{
  int array[11]= {0,1,2,3,4,5,6,7,8,9,10};
  int *p , *q;
  p = &array[0];     // pointer to first int.  p = array is equivalent
  q = p+10; cout << *q << endl;      // print array[10]
  q = p+5 ; cout << *q << endl;      // print array[5]
  q = p+11; cout << *q << endl;      // print array[11] which of course
                                     // does not exist! Take care.
  return 0;
}

::::::::::::::
pg7_3.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 158                  C++ and Fortran 90


#include <iostream.h>
#include <stdlib.h>


main()
{
  float* work1 = new float[1000000] ;
  if ( work1 )
    {
      /* ... use it */
      cout << " Allocation successful!\n";
    }
  else 
    cout << " Allocation failed\n";


  float* work2 = new float[1000000];
  if ( !work2 )
    {   
      cout << "Allocation failed\n"; 
      exit(1);
    }

   /* ... use it */ 
  cout << " using work2 area\n";
  
  return 0;
}


::::::::::::::
pg7_4.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 161                  C++ and Fortran 90


#include <iostream.h>
#include <stdlib.h>

main()
{
  int i = 0x4C697645;         // 4-byte int LivE
  int *p_int = &i;
  char *p_c;
  p_c = (char *) p_int;       // cast to char
  cout << p_c[0] << " " << p_c[1] << " "
       << p_c[2] << " " << p_c[3] << endl;
  cout << p_c[0] << p_c[1] << p_c[2] << p_c[3] << endl;

                             // output = EviL
  return 0;
}


::::::::::::::
pg7_5.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 161                  C++ and Fortran 90


#include <iostream.h>
#include <stdlib.h>

main()
{
  int i = 0X4C6F4F70;                // 4-byte int = LoOp
  int *p_int = &i;
  char *p_c;
  typedef char* charpoint;
  p_c = charpoint(p_int);
  cout << p_c[0] << p_c[1] << p_c[2] << p_c[3] << endl;
                                     // outputs pOoL

/*
  int i = 123;                       // 4-byte int
  int *p_int = &i;
  char *p_c;
  p_c = (char *) p_int;              // cast to char, what happens?
  cout << p_c[0] << " " << p_c[1] << " "
       << p_c[2] << " " << p_c[3] << endl;
*/

  return 0;
}

::::::::::::::
pg7_6.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 162                  C++ and Fortran 90


#include <iostream.h>
#include <stdlib.h>

main()
{
  double (*trigfun)(double);      // declare trigfun           
  trigfun = &sin;                 // or trigfun = &cos
  /* ... */
  double y = (*trigfun)(1.24);
  cout << y << endl;
  return 0;
}

::::::::::::::
pg7_8.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 164                  C++ and Fortran 90


#include <iostream.h>
#include <stdlib.h>


struct star
{
  float x , y;
  void move_up(float d) 
    { 
      y += d; 
    }
  void move_left(float d) 
    { 
      x -= d; 
    }
  /* ... */
};

main()
{
  star pattern[100];           // 100 stars
  void (star::*move)(float);   // move is a pointer-to-member-function-of-star
  move = &star::move_left;     // or move_up or...
                               // move all even numbered stars 10 units
  for(int i=0; i<99; i+=2) (pattern[i].*move)(10.0F);   // necessary brackets
  return 0;
}




