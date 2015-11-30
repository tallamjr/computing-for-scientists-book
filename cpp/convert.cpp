#include <iostream>
#include <string>
/* using std::cout; */
/* using std::cin; */
using namespace std;
int main()
{
    //Convert a number of seconds to the
    //"hours, minutes, seconds" notation
    //Written 23-11-15
    //by Tarek Allam Jr.
    //page 16.
int total;
cout << "Time in seconds? \n";
cin >> total;           // read in time
int hour = total/3600;  // integer divide
int minute = (total-3600*hour)/60;
int second = total-3600*hour-60*minute;
cout << "A time of " << total
    << "seconds \n";
cout << "corresponds to ";
cout << hour << "Hours \n";
cout << minute << "Minutes and \n";
cout << second << "Seconds \n";
return 0;
}
