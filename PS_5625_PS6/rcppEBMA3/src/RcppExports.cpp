// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

#ifdef RCPP_USE_GLOBAL_ROSTREAM
Rcpp::Rostream<true>&  Rcpp::Rcout = Rcpp::Rcpp_cout_get();
Rcpp::Rostream<false>& Rcpp::Rcerr = Rcpp::Rcpp_cerr_get();
#endif

// CPP_EBMA
// Please note that this function is loosely based off the thre  NumericVector CPP_EBMA(NumericMatrix x, NumericVector y, NumericVector W_Hats, double sd, double tol);
RcppExport SEXP _rcppEBMA3_CPP_EBMA(SEXP xSEXP, SEXP ySEXP, SEXP W_HatsSEXP, SEXP sdSEXP, SEXP tolSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericMatrix >::type x(xSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type y(ySEXP);
    Rcpp::traits::input_parameter< NumericVector >::type W_Hats(W_HatsSEXP);
    Rcpp::traits::input_parameter< double >::type sd(sdSEXP);
    Rcpp::traits::input_parameter< double >::type tol(tolSEXP);
    rcpp_result_gen = Rcpp::wrap(CPP_EBMA(x, y, W_Hats, sd, tol));
    return rcpp_result_gen;
END_RCPP
}
// W_H
// Reweighting function, similar to what was done on our in-class assignment. NumericVector W_H(NumericMatrix Z_H);
RcppExport SEXP _rcppEBMA3_W_H(SEXP Z_HSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericMatrix >::type Z_H(Z_HSEXP);
    rcpp_result_gen = Rcpp::wrap(W_H(Z_H));
    return rcpp_result_gen;
END_RCPP
}
// Z_H
NumericMatrix Z_H(NumericMatrix x, NumericVector y, NumericVector W_H, double sd);
RcppExport SEXP _rcppEBMA3_Z_H(SEXP xSEXP, SEXP ySEXP, SEXP W_HSEXP, SEXP sdSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericMatrix >::type x(xSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type y(ySEXP);
    Rcpp::traits::input_parameter< NumericVector >::type W_H(W_HSEXP);
    Rcpp::traits::input_parameter< double >::type sd(sdSEXP);
    rcpp_result_gen = Rcpp::wrap(Z_H(x, y, W_H, sd));
    return rcpp_result_gen;
END_RCPP
}
// rcpp_hello_world
List rcpp_hello_world();
RcppExport SEXP _rcppEBMA3_rcpp_hello_world() {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    rcpp_result_gen = Rcpp::wrap(rcpp_hello_world());
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_rcppEBMA3_CPP_EBMA", (DL_FUNC) &_rcppEBMA3_CPP_EBMA, 5},
    {"_rcppEBMA3_W_H", (DL_FUNC) &_rcppEBMA3_W_H, 1},
    {"_rcppEBMA3_Z_H", (DL_FUNC) &_rcppEBMA3_Z_H, 4},
    {"_rcppEBMA3_rcpp_hello_world", (DL_FUNC) &_rcppEBMA3_rcpp_hello_world, 0},
    {NULL, NULL, 0}
};

RcppExport void R_init_rcppEBMA3(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
