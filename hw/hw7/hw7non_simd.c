#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <assert.h>
#include <time.h>

int main(void) {
    struct timespec start, end; // structures to store the start and end times
     // declare
    uint32_t *pBitmap, row, col;
    int pixel, red, green, blue, alpha, bw; //
    int height = 17280, width = 30720;
    
    // allocate memory for the bitmap
    pBitmap = (uint32_t*) malloc(height * width * sizeof(uint32_t));
    assert(pBitmap != NULL); // make sure the memory was allocated successfully
    srand(48763); // seed the random number generator
    
    // loop over each row of the bitmap
    for (row=0; row<height; row++) {
        for (col=0; col<width; col++) {
            pBitmap[col+row*width] = rand(); // set the pixel value to a random value
        }
    }
    // START
    clock_gettime(CLOCK_REALTIME, &start);
    for (row=0; row<height; row++) {
        for (col=0; col<width; col++) {
            pixel = pBitmap[col+row*width];
            //printf("%d\n", pixel);
            alpha = (pixel >> 24) & 0xff;
            red = (pixel >> 16) & 0xff;
            green = (pixel >> 8) & 0xff;
            blue = pixel & 0xff;
            // calculate the grayscale value of the pixel
            bw = (int) (red*0.299 + green*0.587 + blue*0.114);
            // store the grayscale pixel value back in the bitmap
            pBitmap[col + row*width] = (alpha<<24) +
                (bw<<16) +
                (bw<<8) +
                (bw);
        }
    }
    clock_gettime(CLOCK_REALTIME, &end);
    
    // calculate the elapsed time
    uint64_t result = end.tv_nsec - start.tv_nsec;

    // print the elapsed time to the standard error stream
    fprintf(stderr, "took %lu ns\n", result);
    
    // print the grayscale values of all the pixels in the bitmap
    for (int i = 0; i < height * width; i++) {
        printf("%d ", pBitmap[i]);
    }
    free(pBitmap);
    return 0;
}
