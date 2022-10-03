#include <stdlib.h>
#include <stdio.h>

int main() {
    int ret = 1;
    char buf[512] = {0};
    int i = 0;

    while (ret > 0) {
        int tmp = 0;
        ret = scanf("%x\n", &tmp);
        if (ret <= 0) {
        } else if (tmp == 127) {
            buf[--i] = 0;
        } else {
            buf[i++] = (char)tmp;
        }
    }
    printf("%s\n", buf);
    return 0;
}