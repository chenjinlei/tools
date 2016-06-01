INC=-I /usr/local/Cellar/cunit/2.1-3/include/ 
LIB=-L /usr/local/Cellar/cunit/2.1-3/lib/

all: testcase.c strformat.c
	gcc -o test $(INC) $(LIB) $^ -lcunit 
