::::::::::::::
pg2_0.cpp
::::::::::::::
// Barlow and Barnett, Computing for Scientists 1998
// page 31                  C++ and Fortran 90

// ch2_decl.cpp

main()
{
 float  x_data;
 float  q_distance , alpha , beta , zeta;
 int   mindex , minus_kk , top;


 float q = 32.6 , charge = 1.6e-19;
 float x = 32.78 , y = 1.234E5;
 int  index = 15 , beast = 666;


 int   i = 10;
 int   range = 101*3 -7;
 int   j = i + 5;     // legal in C++


 int m;
 m = 33;
 float z = 0.5;       // legal in-line definition

}
::::::::::::::
pg2_11.cpp
::::::::::::::
// Barlow and Barnett, Computing for Scientists 1998
// page 53                  C++ and Fortran 90

main()
{
  int i = 12345;
  char *p; 
  p = (char*) i;                 // legal (though dangerous)      
  //             p = char*(i);   // illegal and nonsense
  
  
  typedef char  *Pointer_to_char;
  p = Pointer_to_char(i);        // legal            
  
  
  float x = 1.2345;              // a typical floating point number
  float *p_to_float = &x;        // points to x
  int *p_to_int; 
  p_to_int = (int*) p_to_float;  // pointers now have same value
                                 // but different interpretation
  int j = *p_to_int;             // i is a very peculiar number

}
::::::::::::::
pg2_12.cpp
::::::::::::::
// Barlow and Barnett, Computing for Scientists 1998
// page 54                  C++ and Fortran 90

// Approximations to log(n!)  n>0
#include <iostream.h>
#include <math.h>
main()
{
long int   i , n , int_prod;
float xn , r , r2 , real_prod ,  logfac;
float fac1 , fac2 , fac3;
for ( ; ; )
 {
 cout << " Integer to test "<<
   "[ > 0 and < 10000 ] \n";
 cin >> n ; if (n < 1) break;
 xn = float(n); r = 1.0/xn; r2 = r*r;
 int_prod  = 1; real_prod = 1.0;
   logfac  = 0.0;
 for (i = 1; i<=n; i++)
  {
   if (n < 13) int_prod *= i;
   else if (n < 35) real_prod *= float(i);
   else logfac +=  log(float(i));
  }
 if (n < 13)  logfac =  log(float(int_prod));
 else if (n<35)   logfac =  log(real_prod);
 fac1 = xn*log(xn) - xn;
 fac2 = fac1+0.5*(log(2.0*M_PI*xn));
 fac3 = fac2+r/12.* (1. - r2*(1./30.-r2* 
  (1./105. -r2*(1./140. -r2/99.))));
 cout << "n ,  log n! , and "
  << "approximations \n";
 cout << n <<" "<< logfac <<" "<< fac1
 << " " << fac2 << " " << fac3 << endl;
 }
cout << " n < 1 in factorial \n";
return 0;
}
::::::::::::::
pg2_4.cpp
::::::::::::::
// Barlow and Barnett, Computing for Scientists 1998
// page 34                  C++ and Fortran 90


   #include <iostream.h>
     int n_max = 100;//global variable
     main ()
     {                  // start first block
         int i;
         {    // start second block
            int j = 1234;
	    i = j;
	    cout <<  i  << n_max << endl;  // OK
         }     // end of second block
         i++;// = j;   // Illegal since j has gone      
      }
::::::::::::::
pg2_5.cpp
::::::::::::::
// Barlow and Barnett, Computing for Scientists 1998
// page 35                  C++ and Fortran 90

#include <iostream.h>
void f(void);
main()
{
  f();f();f();f();
}
void f(void)
 {
  static int c1 = 0;
  auto   int c2 = 0;
  cout << "f called " << ++c1 << endl;  
  cout << "f called " << ++c2 << endl;
  /* ... */
 }
::::::::::::::
pg2_7.cpp
::::::::::::::
// Barlow and Barnett, Computing for Scientists 1998
// page 36                  C++ and Fortran 90


#include <iostream.h>
main()
{
 int n;
 float* zdata;           //  pointer to float
 cin >> n;               // get size wanted
 zdata = new float[n];   // reserve block of n floats 
                         // and zdata points to the start of it
 for (int i = 0; i<n; i++) 
   {
     cin >> zdata[i];    // equivalent to cin >> *(zdata+i);
   } 

 for (int i = 0; i<n; i++) 
   {
     cout << zdata[i] << " ";   
   } 
 delete [] zdata;

 //delete zdata;         // doesnt seem to fail !
 for (int i = 0; i<n; i++) 
   {
     cout << zdata[i] << " ";
   }
}
::::::::::::::
pg2_8.cpp
::::::::::::::
// Barlow and Barnett, Computing for Scientists 1998
// page 39                  C++ and Fortran 90

// compute the squares of integers to show problems with int-16 in C++
#include <iostream.h>
main()
 {
  unsigned int k_un;
  //  signed int   m , m1=65536-10 , m2=65536+3; // 'signed int' is a synonym for 'int'
  signed int   m , m1=46340-10 , m2=46340+3; // 'signed int' is a synonym for 'int'
  //  signed int   m , m1=180 , m2=16*16+3; // 'signed int' is a synonym for 'int'
  long int    n_l;
  cout << " unsigned-int   signed-int   long-int " << endl;
  for (k_un=m1 , m=m1 , n_l=m1; k_un < m2; k_un++ , m++ , n_l++)
  {
    cout << k_un <<"  "<< k_un*k_un <<"  "<< m*m <<"  "<< n_l*n_l << endl;
  }
 return 0;
 }
