// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

#ifdef RCPP_USE_GLOBAL_ROSTREAM
Rcpp::Rostream<true>&  Rcpp::Rcout = Rcpp::Rcpp_cout_get();
Rcpp::Rostream<false>& Rcpp::Rcerr = Rcpp::Rcpp_cerr_get();
#endif

// CPP_EBMA
NumericVector CPP_EBMA(NumericMatrix x, NumericVector y, NumericVector W_Hat, double sd, double tol);
RcppExport SEXP _rcppEBMA_CPP_EBMA(SEXP xSEXP, SEXP ySEXP, SEXP W_HatSEXP, SEXP sdSEXP, SEXP tolSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericMatrix >::type x(xSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type y(ySEXP);
    Rcpp::traits::input_parameter< NumericVector >::type W_Hat(W_HatSEXP);
    Rcpp::traits::input_parameter< double >::type sd(sdSEXP);
    Rcpp::traits::input_parameter< double >::type tol(tolSEXP);
    rcpp_result_gen = Rcpp::wrap(CPP_EBMA(x, y, W_Hat, sd, tol));
    return rcpp_result_gen;
END_RCPP
}
// W_H
NumericVector W_H(NumericMatrix z);
RcppExport SEXP _rcppEBMA_W_H(SEXP zSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericMatrix >::type z(zSEXP);
    rcpp_result_gen = Rcpp::wrap(W_H(z));
    return rcpp_result_gen;
END_RCPP
}
// Z_H
NumericMatrix Z_H(NumericMatrix x, NumericVector y, NumericVector w, double sd);
RcppExport SEXP _rcppEBMA_Z_H(SEXP xSEXP, SEXP ySEXP, SEXP wSEXP, SEXP sdSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericMatrix >::type x(xSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type y(ySEXP);
    Rcpp::traits::input_parameter< NumericVector >::type w(wSEXP);
    Rcpp::traits::input_parameter< double >::type sd(sdSEXP);
    rcpp_result_gen = Rcpp::wrap(Z_H(x, y, w, sd));
    return rcpp_result_gen;
END_RCPP
}
// rcpp_hello_world
List rcpp_hello_world();
RcppExport SEXP _rcppEBMA_rcpp_hello_world() {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    rcpp_result_gen = Rcpp::wrap(rcpp_hello_world());
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_rcppEBMA_CPP_EBMA", (DL_FUNC) &_rcppEBMA_CPP_EBMA, 5},
    {"_rcppEBMA_W_H", (DL_FUNC) &_rcppEBMA_W_H, 1},
    {"_rcppEBMA_Z_H", (DL_FUNC) &_rcppEBMA_Z_H, 4},
    {"_rcppEBMA_rcpp_hello_world", (DL_FUNC) &_rcppEBMA_rcpp_hello_world, 0},
    {NULL, NULL, 0}
};

RcppExport void R_init_rcppEBMA(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}