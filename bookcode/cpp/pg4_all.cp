::::::::::::::
pg4_13.cpp
::::::::::::::
!! Barlow and Barnett, Computing for Scientists 1998
!! page 102                  C++ and Fortran 90

#include <iostream.h>

main()
{
  int i;
  do 
    {
      cout << "Choose number, 1 to 10\n";
      cin >> i;
    } while (i < 1 || i > 10);


  while (1)   
    {       // infinite  loop
      cout << "Give number, 1 to 10\n";
      cin >> i;
      if (i>0 && i<=10)
	break;
      cout << "Must be 1 to 10!";
    }


  cout << "Choose number, 1 to 10\n";
  while(cin >> i ,  (  i<1 || i>10) ) 
    cout << "From 1 to 10! Try again!\n";
  
  
  cout << "Choose number, 1 to 10\n";
  while(cin >> i ,  (  i<1 || i>10) ) 
    cout << "From 1 to 10! Try again!\n";

}
::::::::::::::
pg4_4.cpp
::::::::::::::
// Barlow and Barnett, Computing for Scientists 1998
// page 87                  C++ and Fortran 90


#include <iostream.h>
main()
{
int volts_on=1, 
  readout_working=1, 
  data_present=0, 
  data_valid=1;
if (volts_on)  
  { //...ask for readout condition
    if (readout_working) 
      { //...try and take data
        if (data_present) 
	  {//...check data not rubbish
            if (data_valid)
	      { //... analyse data


	      }
	  }
        else 
	  {
	    cout << "error!\n";      
	  }
      }
  }

data_present=1;
int ok_to_read=(volts_on && readout_working && data_present && data_valid);
if (ok_to_read)  cout << " read_data()" << endl;

int readout_operational=1;

if (volts_on && readout_operational)
  {
    if (!data_present)
      cout << "error! no data present\n";
    else if (data_valid)
      cout << "read_data()\n";
  }


}
