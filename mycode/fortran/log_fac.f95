      program log_factorial
          implicit none
          integer :: i, n, int_prod
          real :: xn, r, r2, real_prod, PI
          real :: fac1, fac2, fac3, logfac
          PI = 4.d0*atan(1.0d0)
          do
          print *, 'Integer factorial n >'
          read *, n; if(n < 1)stop'n < 1'
          xn = real(n); r = 1.0/xn; r2 = r*r
          if (n < 13) then
              int_prod = 1
              do i = 1, n
              int_prod = int_prod*i
              enddo
              logfac = log(real(int_prod))
          elseif (n < 35) then
              real_prod = 1.0
              do i = 1, n
              real_prod = real_prod*real(i)
              enddo
              logfac = log(real_prod)
          else
              logfac = 0.0
              do i = 1, n
              logfac = logfac + log(real(i))
              enddo
          endif
          fac1 = xn*log(xn) - xn
          fac2 = fac1 + 0.5*(log(2.0*PI*xn))
          fac3 = fac2 + (r/12.)*(1.-r2*(1./30.&
        -r2*(1./105.-r2*(1./140.-r2/99.))))
          print *,' n, log n!, & approximations'
          print *, n, logfac, fac1, fac2, fac3
          enddo
          end program log_factorial
