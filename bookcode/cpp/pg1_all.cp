// Barlow and Barnett, Computing for Scientists 1998
// page 16                  C++ and Fortran 90

//      The C++ version
#include <iostream.h>
main()
{
 // Convert a number of seconds to the
 // "hours, minutes, seconds" notation
 // Written 15-Dec-1996
 // by Alfred User
 int total;
 cout << " Time in seconds? \n";
 cin >> total;       // read in time
 int hour = total/3600; // integer divide
 int minute = (total-3600*hour) / 60; 
 int second =
    total-3600*hour-60*minute;
 cout << " A time of " << total
      << " seconds \n";
 cout << " corresponds to \n";
 cout << hour << " Hours \n";
 cout << minute << " Minutes and\n";
 cout << second << " Seconds\n"; 
 return 0;
}

