loinux:
	gcc main.c controller.c -s -g3 -o ./build/racer -lSDL2 -lm -ffast-math -pthread

winblows:
ifeq ($(OS),Windows_NT)
	x86_64-w64-mingw32-gcc main.c controller.c -o build\\racer.exe\
		-L%cd%\\windowsdl2\\x86_64-w64-mingw32\\lib -pthread\
		-I%cd%\\windowsdl2\\x86_64-w64-mingw32\\include -Dmain=SDL_main\
		-lmingw32 -lSDL2main -lSDL2 -lm\
		-w -Wl,-subsystem,windows -ffast-math\
		-Wl,-Bstatic -lwinpthread
else
	x86_64-w64-mingw32-gcc main.c controller.c -o ./build/racer.exe\
		-L`pwd`/windowsdl2/x86_64-w64-mingw32/lib -pthread\
		-I`pwd`/windowsdl2/x86_64-w64-mingw32/include -Dmain=SDL_main\
		-lmingw32 -lSDL2main -lSDL2 -lm\
		-w -Wl,-subsystem,windows -ffast-math\
		-Wl,-Bstatic -lwinpthread
endif

run:
	-(cd build && ./racer)


run_winblows:
	-(cd build && wine ./racer.exe)
