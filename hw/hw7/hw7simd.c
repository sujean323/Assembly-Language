#include <xmmintrin.h>
#include <immintrin.h>
#include <stdio.h>
#include <assert.h>
#include <stdint.h>
#include <time.h>
int main(void) {
    struct timespec start, end;
    int *pBitmap = NULL;
    const int height = 17280, width = 30720;
    int row = 0, col = 0;
    pBitmap = (uint32_t*) aligned_alloc(32, height * width * sizeof(uint32_t));
    assert(pBitmap != NULL);
    srand(48763);
    for (int i = 0; i < height * width; i++) {
        pBitmap[i] = rand();
        // pBitmap[i] = 0x12345678;
    }
    clock_gettime(CLOCK_REALTIME, &start);
    for (row=0; row<height; row+=1) {
        for (col=0; col<width; col+=8) {
            // load 8x8 block of pixels into AVX register
            __m256i pixels = _mm256_load_si256((__m256i*)&pBitmap[col+row*width]);
            // separate into alpha, red, green, and blue channels
            __m256i alpha = _mm256_and_si256(pixels, _mm256_set1_epi32(0xff000000));
            __m256i red = _mm256_and_si256(pixels, _mm256_set1_epi32(0x00ff0000));
            red = _mm256_srli_epi32(red, 16);
            __m256i green = _mm256_and_si256(pixels, _mm256_set1_epi32(0x0000ff00));
            green = _mm256_srli_epi32(green, 8);
            __m256i blue = _mm256_and_si256(pixels, _mm256_set1_epi32(0x000000ff));

            // calculate grayscale value using formula
            __m256 bw = _mm256_add_ps(
                _mm256_mul_ps(_mm256_cvtepi32_ps(red), _mm256_set1_ps(0.299)),
                _mm256_add_ps(
                    _mm256_mul_ps(_mm256_cvtepi32_ps(green), _mm256_set1_ps(0.587)),
                    _mm256_mul_ps(_mm256_cvtepi32_ps(blue), _mm256_set1_ps(0.114))
                )
            );

            __m256i bw_i = _mm256_cvtps_epi32(bw);
            // combine channels into final pixel value
            __m256i final = _mm256_or_si256(alpha,
                _mm256_or_si256(
                    _mm256_slli_epi32(bw_i, 16),
                    _mm256_or_si256(
                        _mm256_slli_epi32(bw_i, 8), bw_i
                    )
                )
            );

            // store 8x8 block of final pixels back to memory
            _mm256_store_si256((__m256i*)&pBitmap[col+row*height], final);
        }
    }
    clock_gettime(CLOCK_REALTIME, &end);
    uint64_t result = end.tv_nsec - start.tv_nsec;
    fprintf(stderr, "took %lu ns\n", result);
    for (int i = 0; i < height * width; i++) {
        printf("%d ", pBitmap[i]);
    }
    printf("%X\n", pBitmap[10]);
    free(pBitmap);
}
