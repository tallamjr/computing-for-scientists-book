::::::::::::::
pg8_1.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 169                 C++ and Fortran 90


#include <stdio.h>
#include <string.h>

main()
{
  float x = 321.123, y = -1.2e5, Q = 355. / 113.;
  int j = 65566, n = 77777;
  printf("Goodbye World \n");
  printf("Answer %6.3f \n" , x);
  printf("Answers %4i %6.4f %6.3f \n" , j , x , y);
  printf("For %4i hits \n Q= %9.2f\n" , n , Q);

  char fmt1[ ] = "Values %4i %6.4f %6.3f \n";
  printf(fmt1 , j , x , y);
  
  int k = 45678;		printf(" % 6i\n" , k);
  double zx = 12.345;	        printf(" % 6.2f\n" , zx);
  printf("%d %i %o %x \n" , k , k , k , k);

  printf("%+8i\n"  , 1234);
  printf("%-8i\n"  , 1234);
  printf("%08i\n"  , 1234);
  printf("%+-8i\n" , 1234);
  printf("%+08i\n" , 1234);
  printf("%08.4i\n", 99);

  return 0;
}

::::::::::::::
pg8_2.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 178                 C++ and Fortran 90


#include  <stdio.h>
#include  <stdlib.h>

main()
{
  char s[100];
  double dfactor;
  int  shm , hex , oct , dec;

  puts(" input EXACTLY as shown!");
  puts("(12345 x12345 012345) \n");  // parentheses needed here
  int num_inp = scanf("(%i %i %i)" , &dec , &hex , &oct);
  if (num_inp != 3)                  // check number of inputs
    {
      fprintf(stderr , "Input error!\n");
      exit(1);
    }
  printf(" %i %d \n %i %#x \n %i %#o \n" , dec , dec , hex , hex , oct , oct);

  puts(" enter :  millenium bug2000");
  scanf("%[^1234567890]" , s);     // read up to (not including) 1st digit
  scanf("%lf" , &dfactor);         // read the wanted value
  printf("%s \n" , s);
  printf("%f \n" , dfactor);
  printf("%e \n" , dfactor);
  
  puts(" enter : millenium 2000 bug");
  scanf("%[1234567890]" , s);      // read including last digit
  printf("%s \n" , s);
  scanf("%d" , &shm);              // read the wanted value
  printf("%i \n" , shm);
  //flush;
  return 0;
}

::::::::::::::
pg8_3.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 180                 C++ and Fortran 90


#include <iostream.h>
#include <iomanip.h>
#include <math.h>

main()
{
  for (int j=1; j<=20; j++)
    cout<<  j << " " << sqrt(float(j)) << endl;
  return 0;
}

::::::::::::::
pg8_4.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 180                 C++ and Fortran 90

#include <iostream.h>
#include <iomanip.h>
#include <math.h>

main()
{
  cout << setiosflags(ios::showpoint);
  cout << setiosflags(ios::fixed);
  for (int j=1; j<20; j++)
    cout << setw(4) << j << setw(10)
         << setprecision(4) << sqrt(float(j)) << endl;
  return 0;
}

::::::::::::::
pg8_5.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 181                 C++ and Fortran 90


#include <iostream.h>
#include <iomanip.h>
#include <math.h>

ostream& myform (ostream &s);

main()
{
  cout << setiosflags(ios::showpoint);
  cout << setiosflags(ios::fixed);
  for (int j=1; j<20; j++)
    cout << setw(4) << j << setw(10)
         << setprecision(4) << sqrt(float(j)) << endl;

  float x = 9876.54321 , y = -31.4159;
  cout << "Answer " << myform << x << myform << y << endl;

  return 0;
}


ostream& myform (ostream &s) 
{    
  return s << setw(9) << setprecision(3);   
}

::::::::::::::
pg8_6.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 183                 C++ and Fortran 90


// prime listing using C++/C standard I/O 

#include <stdio.h>
#include <stdlib.h>

int isprime(int r);                         // function prototype

main()
{
   int ktest = 1 , nrows;
   printf(" Please give number of rows to be printed : ");
   scanf("%i" , &nrows);                   // desired number of rows
   int ntodo = nrows*10;                   // at 10 values on each row
   printf("===================================\n");
   for (int i=1;  i<=ntodo;  i++)
     {                // loop over rows
       while(!isprime(++ktest)) ;          // find next prime
       printf("%5i" ,  ktest);
       if(i%10 == 0) printf("%8i\n" , i);  // end-of-line printing
     }
   printf("===================================\n");
   return 0;
}

int isprime(int r)
  {         // is r a prime number? - used only for sequence from 1
    int static nprimes = 0;
    int static primes[201];                 //  list of known primes
    for(int i=1; i<=nprimes; i++) if( !(r%primes[i]) ) return 0;
    primes[++nprimes] = r;                  // add to  list of primes
    if (nprimes > 200) exit(EXIT_FAILURE);
    return 1;
  }

::::::::::::::
pg8_7.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 182                 C++ and Fortran 90


// prime listing using C++ Stream I/O

#include <iostream.h>
#include <stdlib.h>
#include <iomanip.h>

int isprime(int r);                                // function prototype

main()
{
  cout << setw(40) << setfill('=') << "=" << setfill(' ') << endl; 
  int ktest = 1 , nrows;
  cout << "How many rows to print? " << flush;
  cin  >> nrows;
  int ntodo = nrows * 10;
  for (int i=1;  i<=ntodo;  i++)
    {
       while( !isprime(++ktest) ) ;
       cout << setw(5) << ktest;
       if(i%10 == 0) cout << setw(8) << i << endl; // end-of-line printing
    }
  cout << setw(40) << setfill('=') << "=" << setfill(' ') << endl; 
}


int isprime(int r)
  {         // is r a prime number? - used only for sequence from 1
    int static nprimes = 0;
    int static primes[201];                        //  list of known primes
    for(int i=1; i<=nprimes; i++) if( !(r%primes[i]) ) return 0;
    primes[++nprimes] = r;                         // add to  list of primes
    if (nprimes > 200) exit(EXIT_FAILURE);
    return 1;
  }

::::::::::::::
pg8_8.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 188                 C++ and Fortran 90


#include <stdio.h>

main()
{
  float x, y, z;

  FILE *pf;                         // pointer to FILE
  pf = fopen("measure.dat" , "r");
  fscanf(pf , "%f %f %f\n" , &x , &y , &z);
  fclose(pf);
  
  printf("x y z = %f %f %f \n" , x , y , z);

  return 0;
}

::::::::::::::
measure.dat
::::::::::::::

1.8765  2.4123 0.03

::::::::::::::
pg8_9.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 188                 C++ and Fortran 90


#include <iostream.h>
#include <fstream.h>

main()
{
  
  float x, y, z;

  ifstream measurements; 
  measurements.open("measure.dat");
  measurements >> x >> y >> z;
  measurements.close( );

  cout << x << " " << y << " " << z << endl;
  return 0;
}


::::::::::::::
pg8_10.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 189                 C++ and Fortran 90


#include <stdio.h>

main()
{
  FILE *fp1 = fopen("data.01" , "r");      // open existing file  for read
  FILE *fp2 = fopen("results.01" , "w");   // open new file for write 
  FILE *fp3 = fopen("log" , "a"); 	   // open file for output,
                                           // appending data at the end
  return 0;
}

::::::::::::::
pg8_11.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 189                 C++ and Fortran 90

#include <fstream.h>

main()
{
  
  ifstream f1; ofstream f2; fstream f3;
  f1.open("data.001"); 			        // input file stream
  f2.open("results.001");			// output file stream
  f3.open("dictionary.dat", ios::in | ios::out);
  return 0;
}

::::::::::::::
pg8_12.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 190                 C++ and Fortran 90

#include <stdio.h>
#include <stdlib.h>

main()
{

  FILE *fp1 = fopen("OLD.DATA", "r");
  if( fp1 == NULL )                     // or if( !fp1 )
    {
      printf(" Failed to open OLD.DATA file \n");
      exit(EXIT_FAILURE);
    }
  return 0;
}

::::::::::::::
pg8_13.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 190                 C++ and Fortran 90


#include <iostream.h>
#include <fstream.h>
#include <stdlib.h>

main()
{
  ifstream datafile; 
  datafile.open("OLD.DATA");
  if(datafile)    
    {
      /* ... */
    }
  else
    {
      cout << " Fail to open OLD.DATA\n";  exit(EXIT_FAILURE);
    }
  return 0;
}

::::::::::::::
pg8_14.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 192                 C++ and Fortran 90


#include <stdio.h>

main()
{
  int i = 456;
  
  FILE *fp;
  float a[10] = {1.1 , 2.2 , 3.3 , 4.4 , 5.5 , 6. , 7. , 8. , 9. , 11.};
  fp = fopen("results" , "wb");
  fwrite(&i , sizeof(int) , 1 , fp);
  fwrite(a , sizeof(float) , 10 , fp);
}

::::::::::::::
pg8_15.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 195                 C++ and Fortran 90


#include <stdio.h>

main()
{
  int pages;
  char name[20] ,  title[100];
  int recsize = sizeof(pages) + sizeof(name) + sizeof(title);
  FILE *fp = fopen("results" , "rb");
  fseek(fp , 99*recsize , SEEK_SET);
  fscanf(fp , "%4i , %s20 , %s100)", &pages ,  name ,  title);
  return 0;
}
