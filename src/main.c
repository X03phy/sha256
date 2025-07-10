#include "../include/sha256.h"

int main( void )
{
	unsigned char hash[32];
	sha256( (const unsigned char *)"Hello", 5, hash );
	for (int i = 0; i < 32; ++i)
		printf("%02x", hash[i]);
	printf("\n");
	return ( 0 );
}
