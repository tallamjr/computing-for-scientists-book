::::::::::::::
pg10_1.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 228 - 229           C++ and Fortran 90


// main program file planets.cpp

#include <iostream.h>
#include "vec.h"                       // read class definitions - note speech marks

main()
{
  vector mars , venus ,  hale_bopp;    // declare some objects of class vector         
  mars.x = 2.28e8; mars.y = 0.01;      // define position of planet mars
  mars.rotate(0.01);                   // rotate 10 mrad
  cout << " Mars position " << mars.x << " " << mars.y << endl;
  cout << " Mars radius "   << mars.length() << endl;
  return 0;
}

// this is file vec.cpp   - the function bodies
//#include "vec.h"                     // need definitions in this file too
//#include <math.h>

double vector::length()
{   
  return sqrt(x*x + y*y);
}

double vector::scalar_product(vector a) 
{
  return a.x*x + a.y*y;
}

void vector::rotate(double theta)
{                                       // rotate vector through theta radians
  double yy = y , xx = x;
  x=xx*cos(theta) - yy*sin(theta);
  y=xx*sin(theta) + yy*cos(theta);
  return;
}

vector vector::scaled(double f)
{                                       // return a scaled copy
  vector v;
  v.x = f*x;   v.y = f*y;
  return v;
}

::::::::::::::
pg10_2.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 228 - 229           C++ and Fortran 90

// main program file planets.cpp
// compile with vec.cpp

#include <iostream.h>
#include "vec.h"                       // read class definitions - note speech marks

main()
{
  vector mars , venus ,  hale_bopp;    // declare some objects of class vector         
  mars.x = 2.28e8; mars.y = 0.0;       // define position of planet mars
  mars.rotate(0.01);                   // rotate 10 mrad
  cout << " Mars position " << mars.x << " " << mars.y << endl;
  cout << " Mars radius "   << mars.length() << endl;
}

::::::::::::::
pg10_3.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 228, 229, 231          C++ and Fortran 90
 

//added operator definition page 231

// main program file planets.cpp

 #include <iostream.h>
 #include "vec.h"                   // read class definitions - note speech marks

 main()
{
  vector mars , venus ,  hale_bopp; // declare some objects of class vector         
  mars.x=2.28e8; mars.y=0;          // define position of planet mars
  mars.rotate(0.01);                // rotate 10 mrad
  cout << " Mars position " << mars.x << " " << mars.y << endl;
  cout << " Mars radius "   << mars.length() << endl;

//... part of applications program
  vector delta;
  delta.x = 100.0;
  delta.y = 200.0;
  mars = mars + delta;              // perturb  mars
  cout << " Mars position " << mars.x << " " << mars.y << endl;
  cout << " Mars radius "   << mars.length() << endl;
  return 0;
}
// this is file vec.cpp   - the function bodies
//        #include "vec.h"  // need definitions in this file too
//        #include <math.h> // if compiling separately

// ... part of vec.cpp
vector vector::operator+(vector b)
{ 
  vector temp;
  temp.x = x + b.x;
  temp.y = y + b.y;
  return temp;
}


double vector::length()
{   
  return sqrt(x*x + y*y);
}

double vector::scalar_product(vector a) 
{
  return a.x*x + a.y*y;
}

void vector::rotate(double theta)
{       // rotate vector through theta radians
  double yy = y,  xx = x;
  x = xx*cos(theta) - yy*sin(theta);
  y = xx*sin(theta) + yy*cos(theta);
  return;
}

vector vector::scaled(double f)
{       // return a scaled copy
  vector v;
  v.x = f*x;   v.y = f*y;
  return v;
}



::::::::::::::
pg10_4.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 236                 C++ and Fortran 90

// fragment


//  header file
class vec 
{ 
  double x , y;
  friend double  length(vec v); 
};

// function file
double  length(vec v)
{ 
  return sqrt(v.x*v.x+v.y*v.y);
}

// application program 
vec a;
/* ... */
double x =  length(a);

::::::::::::::
pg10_5.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 236                 C++ and Fortran 90

// fragment

//  header file
class vec 
{
  double x , y;
  float  length();
};

// function file
double vec::length()
{
  return sqrt(x*x + y*y);
}

// application program
vec a;
/* ... */
double x = a.length();

::::::::::::::
pg10_6.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 237                 C++ and Fortran 90

// fragment

// header file
class vec2D 
{     // 2D vectors
  double x , y; 
};
class vec
{     // General vectors
  int dimension;
  double* data;
  operator vec2D();  // cast to vec2D
  void vec(int n);    // constructor
  /* ... */
};

// function body file
vec::operator vec2D()
{
  vec2D v;
  v.x = data[0];
  v.y = data[1];
  return v;
} 

::::::::::::::
pg10_7.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 242                 C++ and Fortran 90

// fragments of template code

// This is vector.h

template <class F> class vec

{               // general vector
public:
  int dim;      // vector size
  F* data;      // pointer to elements     
  vec(int n);   // constructor
  void zero();  // zero the vector    
  /* ... */     // other functions...

};

// This is vector.cpp

template <class F> void vec<F>::zero()
{
  for(int  i=0;  i<dim;  i++) data[i]=0.0;
};

template <class F> vec<F>::vec(int n); 
{               // constructor body
  dim = n;
  data = new F(n);  
};


template <class I , class  F> class vect 
{               // general vector
public:
  I dim;        // vector size
  F* data;      // pointer to elements
  /* ... as before */
};


template <class I , class F> 
vect<I , F>::vect(int n) 
{               // constructor body    
  dim = n;
  data = new F(n);  
};

::::::::::::::
pg10_8.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 245 - 249           C++ and Fortran 90

// needs mylist.h and a data file; star.dat

#include <iostream.h>
#include <iomanip.h>
#include <string.h>
#include "mylist.h" 

main()
{
  list starlist;
  star s;
                      // read in the  list and print it out
  while(cin >> s) starlist.insert(starlist.length() , &s);
 
  cout << starlist.length() << " items in  list" << endl;
  cout << " original  list\n" << starlist << endl;

                                       // split  list after 3rd member
  link* ell = starlist[3];
  list* tlist = starlist.tail(ell);
  cout << " after split\n" << starlist << endl;
  cout << *tlist << endl; 
                                       // make a copy 
  list* newlist;
  starlist.copy(newlist);
  cout << " copy \n"; 
  cout << *newlist << endl;
                                       // delete the entry after Rigel
  ell = (*tlist)["Rigel"];
  tlist->chop(ell);
  cout << " deletion \n";
  cout << *tlist << endl;
                                       // merge the two  lists again
  cout << " merge \n";
  tlist->merge(starlist);
  cout << *tlist << endl;
                                       // sort the  list
  cout << " sort\n";
  tlist->sort();
  cout << *tlist << endl;
}

istream& operator>>(istream& i , star& s) 
{
 i >>s.name >> s.magnitude >> s.distance;
 return i;
}

ostream& operator<<
   (ostream& o , star& s) 
{
  o  << setw(20) << s.name
     << setprecision(4) << setw(8)
     << s.magnitude
     << setprecision(4) << setw(9)
     << s.distance;
  return o;
}

ostream& operator<<
   (ostream& o ,  link& k) 
{
  o << k.data << (k.next? "- ->":" END") << endl;
  return o;
}

ostream& operator<<
   (ostream& o ,  list& u) 
{
  for(int i=1; i<=u.length(); i++) 
      o << setw(5) << i << " " << *u[i];
  return o;
}

int  list::length() 
   {                                     // length of list 
       int j;
       link* k = root; 
       for (j=0 ; k ; j++ , k=k->next);
       return j;
   }

link**  list::final() 
   {                                     //  get final element
       link**p = &root; 
       while(*p) p = &(**p).next; 
       return p;
   }

link*  list::operator[ ](int n)
   {                                     //  access by index
       link* k = root; 
       if(k == 0) return 0;              // case if list is empty
       for(int j=1 ; j<n ; k=k->next , j++) 
	 if(k->next == 0) return 0; 
       return  k;
   }

list*  list::tail(link* k)
{                                        // chop off the tail after link k
 list* p = new list;                     // to hold tail
 p->root = k->next;                      // transfer
 k->next = NULL;                         // list drops tail
 return p;                               // return the tail
}

void  list::chop(link*  l) 
{                                        // remove one link
 link* t =  l->next;                     // link for deletion
 l->next = t->next;                      // skip over
 delete t;                               // remove dead link
}

void  list::copy(list* &n)
{                                        // copy this  list to new one
 n = new (list);                         // create new  list
 link* p = root;                         // point to 1st  link 
 if(!p) {n->root = NULL; return;} 
 link** q = &(n->root);                  // for new  list
  do
  {
  *q = new(link);                        // make a new link 
  (**q).data = p->data;                  // copy data
  p = p->next;                           // next link to copy
  q = &(**q).next;                       // where to copy to
  } while (p);                           // repeat till NULL
 (*q) = NULL;                            // terminate new list
 return;     
}

void  list::insert(int n , star* s) 
{                                        // insert new link after link n
 link**l = &root; 
 for(int j=1; j<=n; j++) l = &(**l).next;
 link*t = *l;                            // remember this link
 *l = new  link;                         // make a new link 
 if(s) (**l).data = *s;                  // copy data if present
 (**l).next = t;                         // next  link set to old value
}

void  list::merge(list &add)
{
  link** ell = final();                  // go to end of list
  *ell = add.root;                       // end of old list 
                                         // points to start of new list 
  add.root = NULL;                       // set other 
                                         // list pointer to null
}

link*  list::operator[ ](char *c)
{                                        // access by name
  link*  l = root;
  while(strcmp(c ,  l->data.name))
    { 
      l = l->next;
      if(!l) return NULL;
    }
  return l;
}

void  list::sort()
{ 
  int n =  length();                      // get length of this list         
  if(n == 1) return;                      // if length is 1 list is sorted
  list* a = this;                         // pointer a points to this list
  link* ll = (*a)[n/2];                   // find link halfway down
  list* b = a->tail(ll);                  // split list in two
  a->sort();                              // sort them both
  b->sort();                              // (this is a recursive call)
  list *nn = new  list;                   // nn used for the merged list
  link** q = &nn->root;                   // *q points to end of merged list
  link** r = &a->root;                    // *r is used to run along list a
  link** s = &b->root;                    // *s does the same for list b
  while(*s != 0 || *r != 0)               // merge till end of both a and b
    {   
      if (*r == 0 || ( *s != 0 && (**r).data.distance > (**s).data.distance))
	{                                 // take item from list b
	  *q = *s;   // take the item
	  q = &(**s).next;                // next location on merged list
	  *s = (**s).next;                // move one down list b
	} 
      else
	{                                 // take item from list a
	  *q = *r;                        // take the item
	  q = &(**r).next;                // next  location on merged list
	  *r = (**r).next;                // move one down list a
	} 
    }
  this->root = nn->root;                  // merged list pointer to list root
  return;
}



::::::::::::::
mylist.h
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 245                 C++ and Fortran 90


// this is mylist.h

class star
{ 
  char name[20];                 // data
  float magnitude;
  float distance;
                                 // functions declared as friends
  friend ostream& operator << (ostream& o , star& s);
  friend istream& operator >> (istream& o , star& s); 
  friend class list;             // list functions need to know about stars
};

class  link
{      // only 2 items:
 star data;                      // a data item 
 link *next;                     // pointer to the next link 
 friend class list;              // list functions need to know about links
 friend ostream& operator<<(ostream& o ,  link& ell); 
};

class  list
{
 link* root;                     // points to first link - this is the only data  item!
 public:
 link* operator[](int n);
 void insert(int n , star* s=0);
 void chop(link* l);
 void merge(list &add); 
 list* tail(link* l); 
 void copy(list* &n);
 int  length();
 void sort(); 
 link* operator[ ](char* c);
 link** final();
 friend ostream& operator << (ostream& o ,  list& s); 
};

::::::::::::::
vec.h
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 228                 C++ and Fortran 90


// this is file vec.h - the object definitions
class vector 
{                        // 2D vectors
public:                               // no hidden data 
  double x , y;                       // data - cartesian co-ordinates
  double length();                    // functions - length of a vector
  double scalar_product(vector a);    //   take scalar product of 2 vectors
  void rotate(double theta);          //   rotate this vector
  vector scaled(double factor);       //   return a scaled copy 

  vector operator+(vector b);         //   see 10.2.1

  /* ... */                           //    and so on
};                        // remember the semicolon!

::::::::::::::
vecs.h
::::::::::::::

template <class I , class  F> class vect 
  {      // general vector
  public:
    I dim;      // vector size
    F* data;    // pointer to elements
    /* ... as before */
  };

::::::::::::::
star.dat
::::::::::::::

     Sirius   -1.50   8.6
     Canopus   -0.73   98.0
     Alpha-Centauri   0.10   4.3
     Vega   0.04   26.0
     Arcturus   0.0   36.0
     Capella   0.05   45
     Rigel   0.08   600
     Procyon   0.34   11.4

::::::::::::::
vec.cpp
::::::::::::::

// Barlow and Barnett, Computing for Scientists 1998
// page 228 - 229           C++ and Fortran 90


// this is file vec.cpp   - the function bodies
// compile with pg10_1.cpp


#include "vec.h"                       // need definitions in this file too
#include <math.h>

double vector::length()
{   
  return sqrt(x*x + y*y);
}

double vector::scalar_product(vector a) 
{
  return a.x*x + a.y*y;
}

void vector::rotate(double theta)
{                                       // rotate vector through theta radians
  double yy = y , xx = x;
  x = xx*cos(theta) - yy*sin(theta);
  y = xx*sin(theta) + yy*cos(theta);
  return;
}

vector vector::scaled(double f)
{                                       // return a scaled copy
  vector v;
  v.x = f*x;   v.y = f*y;
  return v;
}


