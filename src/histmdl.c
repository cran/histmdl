#include <assert.h>
#include <limits.h>
#include <stddef.h> // for NULL
#include <R.h>
#include <Rinternals.h>
#include <R_ext/Rdynload.h>


/* Highest index of a value less than or equal to a search value */
SEXP maxLE( SEXP Rx, SEXP Rv ){
  assert( isReal( Rx ) );
  double *x, v;
  int l, i, b;

  // Set l to the highest index in x
  l = length( Rx ) - 1;
  if( l < 0 ) return R_NilValue;
  x = REAL( Rx );
  v = asReal( Rv );
  if( x[0] > v ) return R_NilValue;
  // Set b to the most significant bit in l
  b = l | ( l >> 1 );
  b |= b >> 2; b |= b >> 4; b |= b >> 8; b |= b >> 16;
#if INT_MAX > ( 1 << 32 )
  b |= b >> 32;
#endif
  b ^= b >> 1;

  for( i = 0; b; b >>= 1 ){
    // Verify that i + b is within range
    if( l & b ){
      if( x[i | b] > v ){
        // No more range checking is needed
        while( b >>= 1 ) if( x[i | b] <= v ) i |= b;
        break;
      } else i |= b;
    } //if
  } //for
  return ScalarInteger( i + 1 );
} //maxLE


static const R_CallMethodDef CallEntries[] = {
  { "maxLE", (DL_FUNC) &maxLE, 2 },
  { NULL, NULL, 0 }
};


void R_init_histmdl( DllInfo *dll ){
  R_registerRoutines( dll, NULL, CallEntries, NULL, NULL );
  R_useDynamicSymbols( dll, FALSE );
} //R_init_histmdl
