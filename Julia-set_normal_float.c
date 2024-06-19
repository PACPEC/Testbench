#include "../flexfloat/include/flexfloat.h"

int main() {
    float y,x;
    
    for(y = -1.0; y < 1.0; y += 0.05) {
        for(x = -1.5; x < 1.5; x += 0.025) {
            float zr = x;
            float zi = y;
            int i = 0;
            do {
                float zr1 = zr*zr - zi*zi - 0.79;
                zi = zr*zi*2 + 0.15;
                zr = zr1;
                if((zr*zr + zi*zi) > 4) break;
                i += 1;
            } while (i < 100);
        }
    }
}
