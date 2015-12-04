::::::::::::::
pg9_3.cpp
::::::::::::::
// Barlow and Barnett, Computing for Scientists 1998
// page 199                 C++ and Fortran 90


#include <iostream.h>
#include <math.h>

main()  
{                                //program epsilon
  float eps , one=1.0 , oneeps;
  eps = pow(2.0 , -14);          // as a start 
  for (int k =1; k <= 16; k++) 
    { 
      eps /= 2.0; oneeps = one + eps;
      int testeps = (oneeps != one); 
      cout << oneeps - one << " " << eps  << " " << testeps << endl; 
    }
  return 0;	
}
::::::::::::::
pg9_4.cpp
::::::::::::::
// Barlow and Barnett, Computing for Scientists 1998
// page 205                 C++ and Fortran 90

#include <iostream.h>
#include <math.h>

main()

{  /* ... */
  float h , m , lam , q , E;
  h = 6.626e-34;  m = 1.675e-27;
  lam = 5.0e-6 ;  q = 1.602e-19;
  float h2  = pow(h , 2);
  float den = 2.0 * m * pow(lam , 2);
  E = h2 / den;
  cout << " Energy in J and eV " << E << "  " << E/q << endl;

  return 0;
}
::::::::::::::
pg9_5.cpp
::::::::::::::
// Barlow and Barnett, Computing for Scientists 1998
// page 206                 C++ and Fortran 90

#include <iostream.h>
#include <math.h>

main()
{
                              // using appropriate units
  float hc , mc2 , lam , E;
  hc  = 1239.7;               // eV nm
  mc2 = 939.6e6;              // eV
  lam =  5000.;               // nm
  E = pow(hc/lam , 2) / (2.0*mc2);
  cout << " Energy in eV " << E << endl;

  return 0;
}
::::::::::::::
pg9_6.cpp
::::::::::::::
// Barlow and Barnett, Computing for Scientists 1998
// page 212                 C++ and Fortran 90


#include <iostream.h>

float mean(int n , float old , float y)
{                          //== returns mean, updated by y
                           //== y is the Nth value
  return old + (y-old) / float(n);
}

//== example of its use :

main()
{
  float m = 0.0;
  float speed[5] = {10. , 23. , 41. , 50. , 60.};
  for(int i=1; i<=5; i++) 
    m = mean(i , m , speed[i-1]);
  cout << " mean value = " << m << endl;
  return 0;
}
::::::::::::::
pg9_7.cpp
::::::::::::::
// Barlow and Barnett, Computing for Scientists 1998
// page 213                 C++ and Fortran 90


#include <iostream.h>
#include <math.h>

main()
{
  float a , b , c , d , x , poly;      
  x = 1.01F; 
  a = pow(x , 4) ;            b = 4.0F*pow(x , 3);
  c = 6.0F*pow(x , 2) ;       d = 4.0F*x;
  poly = a - b + c - d + 1.0F; 
  cout << " polynomial " << poly << endl;
  cout << " double storage " <<  pow(x , 4) - 4.0F*pow(x , 3)
    + 6.0F*pow(x , 2) - 4.0F*x + 1.0F << endl;
  return 0;
}
::::::::::::::
pg9_8.cpp
::::::::::::::
// Barlow and Barnett, Computing for Scientists 1998
// page 217                 C++ and Fortran 90

//       program sum_4 for inverse 4th powers

#include <iostream.h>
#include <iomanip.h>
#include <math.h>

main()
{
  double pi_4=pow(M_PI , 4) / 90.0;
  double sum = 0. ,  one = 1.0; 
  long int k , ktot;
  for( ; ; )
    {
      sum = 0.0;
      cout << "ktot = sum limit\n";
      cin  >> ktot;
      if (ktot < 1) break;
      for (k=1; k<=ktot; k++)
	sum += one / pow(double(k) , 4);
      cout << setprecision(14) << sum 
	   << "              " << pi_4-sum << endl;
    }
  return 0;
}
::::::::::::::
pg9_9.cpp
::::::::::::::
// Barlow and Barnett, Computing for Scientists 1998
// page 221                 C++ and Fortran 90

// example of Least squares code

#include <iostream.h>
#include <math.h>

int LeastSquares(double x[ ] , double y[ ] , double sig , int n);
double var_p(double p[ ] , double *p_bar , int n);
double covxy(double p[ ] , double q[ ] , double p_bar , double q_bar , int n);
// the prototypes  

int LeastSquares(double x[ ] , double y[ ] , double sig , int n)

  //==least-squares calculation  data in arrays x[n] , y[n] , error in sig

{            //==========carry out checks for n > 2 , sig > 0.0 , etc
  double x_bar , y_bar , var_x , var_y , cov_xy , a , b ;
  var_x  = var_p(x , &x_bar , n);
  var_y  = var_p(y , &y_bar , n);
  cov_xy = covxy(x , y , x_bar , y_bar , n);
  b = cov_xy / var_x;   a = y_bar - b*x_bar; 
  double chisq = 0.0;     
  for (int k=0; k<n; k++)
    chisq += pow( ( y[k] - y_bar - b*(x[k]-x_bar) )/sig  , 2);
                  //=======test for acceptable fit
  if (fabs(sqrt(chisq) - sqrt(n-2)) > 2.1)
    cout << " Check data, fit is bad. Chisq = " << chisq << endl;
                  //=======output results ...
  cout << " intercept a = " << a << endl;
  cout << " slope     b = " << b << endl;
  //=======output other details and graph the results. Plot residuals !
  return 0;
}

double var_p(double p[ ] , double *p_bar , int n)
{      //=======find variance of vector : updating variance & mean
  *p_bar = p[0] ; double varp = 0.0;
  for (int k=1; k<n; k++)
    { 
      double dk = double(k+1);
      double del_k = (p[k] - *p_bar) / dk;
      *p_bar += del_k; 
      varp = double(k)*(varp/dk + del_k*del_k);
    }
  return varp;
}

double covxy(double p[ ] , double q[ ] , double p_bar , double q_bar , int n)
{             //=======find covariance, using arrays & means
  double  covpq = 0.0;
  for (int k=0; k<n; k++)
    covpq += (p[k] - p_bar) * (q[k] - q_bar);
  return covpq / double(n);
}

main()
{
  double x[6] = {0. , 1. , 2. , 3. , 4. , 5.};
  double y[6] = {0.9 , 4.2 , 9.8 , 14.5 , 17.3 , 21.9};
  double sig  = 0.5;
  int n = 6;
  cout << "\n Data from Table 9.8 page 219 \n\n"; 
  LeastSquares(x , y , sig , n);
  return 0;
}
