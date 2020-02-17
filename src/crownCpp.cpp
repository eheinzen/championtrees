#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
IntegerVector crownCpp(NumericVector x, IntegerVector speciesStarts)
{
  IntegerVector out(x.size());

  for(int i = 0; i < speciesStarts.size() - 1; i++)
  {
    double mx = x[speciesStarts[i]];
    double limit = mx - max(NumericVector::create(3.0, 0.03 * mx));

    for(int j = speciesStarts[i]; j < speciesStarts[i+1]; j++)
    {
      bool cochamp = false;

      if(j == speciesStarts[i])
      {
        out[j] = 2;
      } else if(x[j] >= limit && !cochamp)
      {
        out[j-1] = 1;
        out[j] = 1;
        cochamp = true;
      } else if(x[j] >= limit)
      {
        out[j] = 1;
      } else break;
    }
  }
  return out;
}
