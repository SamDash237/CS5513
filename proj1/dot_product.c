#include <stdio.h>
#include <math.h>
#include <xmmintrin.h>

float dot_product(float *a, float *b, int len)

{
  __m128 xmm1, xmm2, xmm3, xmm4;
  float emptyArray[4] = {0.0, 0.0, 0.0, 0.0};
  xmm4 = _mm_load_ps(emptyArray);
  int i;

  for(i = 0; i < len; i = i + 4)
  {

    xmm1 = _mm_load_ps(a+i);
    xmm2 = _mm_load_ps(b+i);

    xmm3 = _mm_mul_ps(xmm1, xmm2);
    xmm4 = _mm_add_ps(xmm3, xmm4);

  }
  float tmp[4];
  _mm_store_ps(tmp, xmm4);
  
  return tmp[0] + tmp[1] + tmp[2] + tmp[3];
}