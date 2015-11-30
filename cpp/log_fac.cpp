// Approximations to log(n!) n > 0
// page 54.
#include <iostream>
#include <math.h>

using namespace std;

int main()
{
    long int i, n, int_prod;
    float xn, r, r2, real_prod, logfac;
    float fac1, fac2, fac3;
    for ( ; ; )
    {
        cout << "Integer to test " << "[ n > 0 ]\n";
        cin >> n ; if (n < 1) break;
        xn = float(n); r = 1.0/xn; r2 = r*r;
        int_prod = 1; real_prod = 1.0;
        logfac = 0.0;
        for (i=1;i<=n;i++)
        {
            if(n < 13) int_prod *=i;
            else if (n < 35) real_prod *=float(i);
            else logfac += log(float(i));
        }
        if (n < 13) logfac = log(float(int_prod));
        else if (n < 35) logfac = log(real_prod);
        fac1 = xn * log(xn) - xn;
        fac2 = fac1 + 0.5*(log(2.0*M_PI*xn));
        fac3 = fac2 + r/12.*(1.-r2*(1./30.-r2*(1./105.-r2*(1./140.-r2/99))));
        cout << "n, log n!, and " << "approximations \n";
        cout << n << " " << logfac << " " << fac1 << " " << fac2 << " " << fac3 << endl;
    }
    cout << " n < 1 in factorial \n";
        return 0;
}
