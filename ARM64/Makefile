HelloWorld: HelloWorld.o
	ld -o jun jun.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64

HelloWorld.o: HelloWorld.s
	as -arch arm64 -o jun.o jun.s
