#include <fcntl.h>
#include <stdlib.h>
#include <stdio.h>

int main(int ac, char **av) {

    if (ac < 2) {
        dprintf(2, "Usage: ./%s filepath\n", av[0]);
        return 1;
    }

    int fd = open(av[1], O_RDONLY);
    if (fd < 0) {
        dprintf(2, "Cannot open %s\n", av[1]);
        return 1;
    }

    const int size = 512;
    char buf[size];
    int bytes = read(fd, buf, size - 1);
    if (bytes < 0) {
        dprintf(2, "Cannot read %d -> %s\n", fd, av[1]);
        return 1;
    }

    buf[bytes] = 0;
    int i;
    for (i = 0; i < bytes && buf[i] != '\n'; i++) {
        buf[i] -= i;
    }

    printf("Token: %s\n", buf);
    return 0;
}