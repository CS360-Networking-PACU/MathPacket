#############################################################################
# File name:  Makefile
# Author:     chadd williams
# Date:       Sept 1, 2021
# Class:      CS360
# Assignment: MathPacket
# Purpose:    
#############################################################################

all: bin bin/mathPacket_client bin/mathPacket_server bin/mathPacket_errors

bin:
	mkdir -p bin

bin/mathPacket_client: bin/mathPacket_client.o
	gcc -o bin/mathPacket_client -g -Wall bin/mathPacket_client.o

bin/mathPacket_client.o: bin src/mathPacket_client.c
	gcc -c -o bin/mathPacket_client.o -g -Wall src/mathPacket_client.c

bin/mathPacket_server: bin/mathPacket_server.o
	gcc -o bin/mathPacket_server -g -Wall bin/mathPacket_server.o

bin/mathPacket_server.o: bin src/mathPacket_server.c
	gcc -c -o bin/mathPacket_server.o -g -Wall src/mathPacket_server.c

bin/mathPacket_errors: bin/mathPacket_errors.o
	gcc -o bin/mathPacket_errors -g -Wall bin/mathPacket_errors.o

bin/mathPacket_errors.o: bin src/mathPacket_errors.c
	gcc -c -o bin/mathPacket_errors.o -g -Wall src/mathPacket_errors.c


valgrind_client: bin/mathPacket_client
	valgrind -v --leak-check=yes --track-origins=yes --leak-check=full --show-leak-kinds=all bin/mathPacket_client 127.0.0.1 8080 1 + 2

valgrind_server: bin/mathPacket_server
	valgrind -v --leak-check=yes --track-origins=yes --leak-check=full --show-leak-kinds=all bin/mathPacket_server 8080

clean:
	rm -f bin/*
