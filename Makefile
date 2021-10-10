#############################################################################
# File name:  Makefile
# Author:     chadd williams
# Date:       Sept 1, 2021
# Class:      CS360
# Assignment: 
# Purpose:    
#############################################################################

all: bin bin/main

bin:
	mkdir -p bin

bin/main: bin/main.o
	gcc -o bin/main -g -Wall bin/main.o

bin/main.o: bin src/main.c
	gcc -c -o bin/main.o -g -Wall src/main.c

valgrind: bin/main
	valgrind -v --leak-check=yes --track-origins=yes --leak-check=full --show-leak-kinds=all bin/main
	
clean:
	rm -f bin/main bin/*.o
