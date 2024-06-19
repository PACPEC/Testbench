#include "../flexfloat/include/flexfloat.h"

int main() {
    flexfloat_t y,x;
    flexfloat_t y_limit,x_limit;
    flexfloat_t y_add, x_add;


    ff_init_float(&y, -1.0, (flexfloat_desc_t) {6,9});
    ff_init_float(&y_limit, 1.0, (flexfloat_desc_t) {6,9});
    ff_init_float(&x_limit, 1.5, (flexfloat_desc_t) {6,9});
    ff_init_float(&y_add, 0.05, (flexfloat_desc_t) {6,9});
    ff_init_float(&x_add, 0.025, (flexfloat_desc_t) {6,9});
    while(ff_lt(&y,&y_limit)) {
        ff_init_float(&x, -1.5, (flexfloat_desc_t) {6,9});
        while(ff_lt(&x, &x_limit)) {
            flexfloat_t zr,zi 
            ff_cast(&zr, &x, (flexfloat_desc_t) {6,9});
            ff_cast(&zi, &y, (flexfloat_desc_t) {6,9});
            int i = 0;
            do {
                flexfloat_t zr1;
                flexfloat_t zr1_middle;
                flexfloat_t constant;

                ff_init(&zr1, (flexfloat_desc_t) {6, 9});
                ff_init(&zr1_middle, (flexfloat_desc_t) {6, 9});
                ff_init(&constant, 0.79, (flexfloat_desc_t) {6, 9});
                ff_mul(&zr1, &zr, &zr);
                ff_mul(&zr1_middle, &zi, zi);
                ff_sub(&zr1, &zr1, &zr1_middle);
                ff_sub(&zr1, &zr1, &constant);

                ff_init(&constant, 0.15, (flexfloat_desc_t) {6, 9});
                ff_mul(&zi, &zr, &zi);
                ff_add(&zi, &zi, &zi);
                ff_add(&zi, &zi, &constant);
                
                ff_cast(&zr, &zr1);
                ff_mul(&zr, &zr, &zr);
                ff_mul(&zi, &zi, &zi);
                ff_add(&zr, &zr, &zi);
                ff_init(&constant, 4, (flexfloat_desc_t) {6, 9});
                if(ff_gt(&zr, &constant)) break;
                i += 1;
            } while (i < 100);
            ff_add(&x, &x, &x_add);
        }
        ff_add(&y, &y, &y_add);
    }
}
