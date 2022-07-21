#define _POSIX_C_SOURCE 200112L

#include <stdio.h>
#include <time.h>

int main() {
	struct timespec ts;
	clock_gettime(CLOCK_REALTIME, &ts);
	printf("%ld\n", ts.tv_nsec);
	return 0;
}
