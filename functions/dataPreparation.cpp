#include <Rcpp.h>
#include <iostream>
#include <string>
#include <vector>
using namespace Rcpp;

// This is a simple example of exporting a C++ function to R. You can
// source this function into an R session using the Rcpp::sourceCpp 
// function (or via the Source button on the editor toolbar). Learn
// more about Rcpp at:
//
//   http://www.rcpp.org/
//   http://adv-r.had.co.nz/Rcpp.html
//   http://gallery.rcpp.org/
//

// [[Rcpp::export]]
NumericVector timesTwo(NumericVector x) {
  
  return x * 2;
}

// [[Rcpp::export]]
void hello()
{
  Rcout << "Sausages" << std::endl;
}

// You can include R code blocks in C++ files processed with sourceCpp
// (useful for testing and development). The R code will be automatically 
// run after the compilation.
//



// [[Rcpp::export]]
int fibonacci(const int x) {
  if (x < 2) return(x);
  return (fibonacci(x - 1)) + fibonacci(x - 2);
}


class MyClass {
  public:
    int myNum;
    std::string myString;
    void myMethod()
    { 
      Rcout << "Hello World!";
    }
};


/*** R
system.time(print(fibonacci(30)))
*/

/*** R
timesTwo(42)
hello()
evalCpp("NAN == NAN")

setClass(
  "MyClass",
  representation(
    myNum = "numeric",
    myString = "character"
  ),
  prototype = list(
    myString = as.character(NULL),
    myNum = as.numeric(as.character(NULL))
  )
)
*/


//


