::::::::::::::
pg5_1.cpp
::::::::::::::
// Barlow and Barnett, Computing for Scientists 1998
// page 104                  C++ and Fortran 90

#include <iostream.h>
// function prototypes
void get_data(float data[ ] , int n);
float mean(float data[ ] , int n);

// main program
main()
{
  float data[100];
  get_data(data , 100);
  cout << "Average " << mean(data,100);
}  
 
void get_data(float d[ ] , int n)
{
  for (int i=0; i<n; i++) 
    cin >> d[i];   // get data
}  

float mean(float a[ ] , int m)
{ 
  float sum=0.0;
  for(int i=0; i<m; i++)
    sum += a[i];
  return sum / float(m);
}
::::::::::::::
pg5_2.cpp
::::::::::::::
// Barlow and Barnett, Computing for Scientists 1998
// page 108                  C++ and Fortran 90


#include <iostream.h>
void out(float q);
main()
{
  float x = 3.14159F , y = 2.71828F;
  out(x); out(y); out(17.3F);
  out(x*x+y-0.3F);
}

void out(float q)
{ 
  cout << " The value is " << q
       << endl;
}
