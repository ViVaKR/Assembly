t: t.o
	ld -o t t.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64
t.o: t.s
	as -o t.o t.s
