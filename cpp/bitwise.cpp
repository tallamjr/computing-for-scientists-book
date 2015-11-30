#include <iostream>
#include <string>
using namespace std;
int main()
{
    //Bitwise conversion tests
    //Written 30-11-15
    //by Tarek Allam Jr.
    //page 46

unsigned int number1;
unsigned int number2;
cout << "Enter a number \n";
cin >> number1;
cin >> number2;

int bitwise = number1 << number2;

cout << bitwise << "   Bitwise conversion \n";

return 0;
}
