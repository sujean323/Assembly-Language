COMPILE = arm-none-eabi-gcc
option = -g -O0
obj = $(wildcard *.s)
tar = $(patsubst %.s,%.exe,$(obj))

all:hw5.exe

hw5.exe : hw5.s idiv.s
	$(COMPILE) $(option) hw5.s idiv.s -o $@
	
clean:
	rm -rf *.exe
