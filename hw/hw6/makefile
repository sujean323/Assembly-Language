COMPILE = arm-none-eabi-gcc
option = -g -O0
obj = $(wildcard *.s)
tar = $(patsubst %.s,%.exe,$(obj))

all:hw6.exe

hw6.exe : hw6.c idiv.s bin2bcd.s bcdadd.s bcdsub.s
	$(COMPILE) $(option) hw6.c idiv.s bin2bcd.s bcdadd.s bcdsub.s -o $@
	
clean:
	rm -rf *.exe
