// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

// crownCpp
IntegerVector crownCpp(NumericVector x, IntegerVector speciesStarts);
RcppExport SEXP _championtrees_crownCpp(SEXP xSEXP, SEXP speciesStartsSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericVector >::type x(xSEXP);
    Rcpp::traits::input_parameter< IntegerVector >::type speciesStarts(speciesStartsSEXP);
    rcpp_result_gen = Rcpp::wrap(crownCpp(x, speciesStarts));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_championtrees_crownCpp", (DL_FUNC) &_championtrees_crownCpp, 2},
    {NULL, NULL, 0}
};

RcppExport void R_init_championtrees(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
