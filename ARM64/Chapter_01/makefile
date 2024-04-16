a: a.o
	ld a.o -o a -l System -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64

a.o: a.s
	as -o a.o a.s
