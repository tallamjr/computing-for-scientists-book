::::::::::::::
pg11_1.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 252, 253            C++ and Fortran 90

// all 3 methods are in this file

// (1) extra agument

void mypoint(float x, float y, float s)
{
  point(x*s , y*s);
  return;
}


// (2) global data

float s = 1.0;                   // global
void set_scale(float ss);
void myplot(float x , float y);

main()
{                                // ...
  s = 2.0;
  plot(2.3 , 4.4);
  // ...
  return 0;
}

void set_scale(float ss)
{
  s = ss;
  return;
}

void myplot(float x , float y)
{
  plot(x*s , y*s);
}


// (3) using a class

class plotter
{
  private:
    float s = 1.0;
  public:
    void set_scale(float ss) 
  {
    s = ss;
  }
    void myplot(float x,float y)
  {
    plot(x*s , y*s);
  }
};

main()
{                             //...
  plotter pp;
  pp.setscale(2.0);
  pp.myplot(2.2 , 3.3);
  // ...
  return 0;
}

::::::::::::::
pg11_7.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 261                 C++ and Fortran 90

// updating formulae for mean and variance

#include <iostream.h>
#include <iomanip.h>

void meanvar(float &mean, float &var , float data[] , int n);

main()
{
  float data[] = {3.782 , 5.540 , 5.769 , 7.066};
  float mean, var;
  meanvar(mean ,  var , data , 4);
  cout << setw(15) << setprecision(9) << mean << " " 
       << setw(15) << setprecision(5) << var  << endl;
  return 0;
}

void meanvar(float &mean , float &var , float data[] , int n)
{      // n data values in the array
  mean = 0.0;
  for(int i=0; i<n; i++)
    {
      data[i] += 12680.000;
      cout << setiosflags(ios::left);
      cout << setw(15) << setprecision(9) << data[i] << endl;
      float delta = (data[i] - mean) / float(i+1);
      mean += delta;
      var += float(i)*delta*delta - var / float(i+1);
    }
  return;
}
::::::::::::::
pg11_9.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 262 - 363           C++ and Fortran 90

// various o-o fragments

vector vector::rotate(double theta)
 {
  vector v;
  v.x = x*cos(theta) - y*sin(theta);
  v.y = x*sin(theta) - y*cos(theta);
  return v;
 }

vector vector::vector_product(vector a)
 {
  vector v;
  v.x = y*a.z - z*a.y; v.y = z*a.x - x*a.z; v.z = x*a.y - y*a.x;
  return v;
 }

vector vector::operator+(vector);
vector vector::operator-(vector);
vector vector::operator*(double); // scale vector by factor
double vector::operator*(vector); // scalar product


// (1) the friend function

friend double sprod(vec u , vec v);
double sprod(vec u , vec v)
{
  return u.x*v.x + u.y*v.y + u.z*v.z;
}
// and call with ...

double ff = sprod(a , b);



// (2) the member function

double sprod(vec v);
double sprod(vec v)
{  
  return u.x*v.x + u.y*v.y + u.z*v.z;
}
// and call with ...

double ff = a.sprod(b);



// finis   arb fecit 11/8/08
