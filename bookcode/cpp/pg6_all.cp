::::::::::::::
pg6_1.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 127                  C++ and Fortran 90

// Program to show conversion  between int and char types in C++

#include <iostream.h>

main ()
{       // int <-> char conversion
  int in;
  char ch;
  cout << "\n Please type a character:  ";
  cin >> ch;
  cout << "Symbol " << ch << " is code " << int(ch) << "\n";
  cout << "\n Please type a number 32 - 128 ; ";
  cin >> in;
  cout << "Code " << in <<  " is symbol " << char(in) << "\n";
  return 0;;
}

::::::::::::::
pg6_2.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 127                  C++ and Fortran 90

#include <ctype.h> 
#include <stdio.h>

main()
{
  int k;
  char ch=0;
  for (k=0; k<256; ch = char(k++))
    {	
      if ( isprint(ch) )
	printf("%d = hex %x is printable as %c \n" , ch , ch , ch);
      else
	printf("%d = hex %x  is not printable \n", ch , ch);
    }
  return 0;
}

::::::::::::::
pg6_3.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 133                  C++ and Fortran 90

#include <iostream.h>
#include <stdio.h>

main()
{
  cout << "hello, world\n";
  printf("hello, world\n");

  cout << "hello hello hello, you big wide wonderful world\n";
  printf( "hello hello hello, you big wide wonderful world\n");
  return 0;
}

::::::::::::::
pg6_4.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 135                  C++ and Fortran 90


#include <iostream.h>
#include <ctype.h>

int query(char p[]);

main()
{
  cout << query("/n give me a sign (y,n..) => ") << endl;
  return 0;
}

int query(char q[ ])
  // Library function that prints a query
  // obtains a yes-no answer
  // and returns true or false
  // 
  //  See section 6.1.2 for 'toupper'
{
  char reply;
  while (cout << q) 
    {          // repeat till satisfied
      cin >> reply;
      switch (toupper(reply))
	{
	case 'Y':
	  return 1;
	case 'N':
	  return 0;
	}
      cout << "Eh? Please reply Y or N\n";
    }
  return 0;
}

::::::::::::::
pg6_5.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 137                  C++ and Fortran 90

// careful with array sizes here

#include <iostream.h>
#include <string.h>

main()
{
  char forename[10] = "Alexander" , 
    surname[10] = " Borodin" , fullname[20];
  strcpy(fullname , forename);
  strcat(fullname , surname);
  cout << fullname << endl;
  return 0;
}

::::::::::::::
pg6_6.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 138 139               C++ and Fortran 90

#include <iostream.h>
#include <string.h>

main()
{
  char symbol[6][3] = {"H " , "He" , "Li", "Be"};
  cout << symbol[1] << endl;
  for (int k=0; k<6; k++)  
    cout << symbol[k] << endl;

  char *warning , *message;
  warning = "Negative Root\n"; 
  message = warning; 
  cout << message;

  char warnin[30] , messag[30];
  strcpy(warnin , "Negative Root\n");
  strcpy(messag , warnin); 
  cout << messag << endl;
  return 0;
}

::::::::::::::
pg6_7.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 139                  C++ and Fortran 90

#include <iostream.h>
#include <string.h>

main()
{
  char timeofday[30] = "Good what?";
  char message[30] = "Each morning!";
  cout << timeofday << endl;
  cout << message << " " << message[5] << endl; 

  strncpy(message+5 , "eve" , 3);
  strncpy(timeofday+5 , message+5 , 7);
  cout << timeofday << endl;
  
  cout << timeofday << endl;
  cout << message << endl; 
  return 0;
}

::::::::::::::
pg6_8.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 142                  C++ and Fortran 90

// attempt to change the terminator of a string

#include <iostream.h> 

main()
{
  char s[6] = "Hello";
  cout << " Final character " <<  s[5] << endl; 
  cout << "Length " << strlen(s) << endl;
  cout << "Size   " << sizeof(s) << endl;
  s[5] = '+';
  cout << " Final character " << s[5] << endl;; 
  cout << "Length " << strlen(s) << endl;
  cout << "Size   " << sizeof(s) << endl;
  cout << "String is " << s << endl;
  return 0;
}

::::::::::::::
pg6_9.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 145 - 150              C++ and Fortran 90

// program to evaluate Moleular Weights

#include <stdlib.h>
#include <fstream.h>
#include <ctype.h>
#include <string.h>

//  function prototypes
float value_of(char *form);
float val_head(char *form , int n);
int   val_count(char *form);
float val_group(char *form , int n);
float val_element(char *form , int n);
void  read_data_file();

// global data
const int max_elements = 92;
float AtWt[max_elements+1];
char symbol[max_elements+1][3];
int npt = 0;

main ()
{
  char formula[100];
  read_data_file();
  cout << "Please enter formula :";
  cin >> formula;
  cout << "Molecular Weight is " << value_of(formula) << endl;
  return 0;
}
// ... function definitions

void read_data_file()
{
  ifstream datastream("pt.dat");
  while (datastream >> symbol[npt] 
    && npt<max_elements) 
       datastream >> AtWt[npt++];
  datastream.close();
  cout << npt << " elements read in\n";
  return;
}

float value_of(char *form)
{
  if(strlen(form) == 0) return 0;
  int lhead = 0 , lcount = 0;
  if (form[0] == '(') 
    { 
      lhead = 1 + strstr(form , ")") - form;
      if (lhead < 0) cout << "Missing )!";
    }
  else 
    lhead = (islower(form[1]) ? 2 : 1);
  lcount = strspn(form + lhead , "1234567890");
  float fhead = val_head(form , lhead);
  int fcount = val_count(form + lhead);
  return fhead * fcount + value_of(form + lhead + lcount);
}

float val_head(char *form , int n)
{
  return(*form == '(' ? val_group(form , n) : val_element(form , n)); 
}

float val_element(char *form , int n)
{
  int  j;
  for (j = 0; j<npt; j++) 
    if (n == strlen(symbol[j]) && !strncmp(symbol[j] , form , n)) 
      return AtWt[j];
  cout << "Unknown Element " << form << endl;
  exit(EXIT_FAILURE);
  return 0.0; 
}

int val_count(char *form)
{
  int i = 0, j = 0;
  while(isdigit(form[j]))
   i = 10*i + form[j++] - '0';
  return i == 0 ? 1 : i;
}


float val_group(char *form , int n)
{
  char *w = new char(n-1);
  strncpy(w , form+1 , n-2);
  w[n-2] = '\0';
  return value_of(w);
}
 

::::::::::::::
pt.dat
::::::::::::::
H    1.0079
He   4.0026
Li    6.941
C    12.011
O    15.9994
F    18.9984
Si   28.0855
S    32.06
Fe   55.847
Cu   63.546
I   126.905
U   238.029


::::::::::::::
char.dat
::::::::::::::
Li
LiH
HI
SiH4
UF6
H2O
H2O2
Fe2(SO4)3
CuSO4(H2O)5
C6H6
C2H5(OH)
H(CH2)8H
C60
LI
Si(H4


