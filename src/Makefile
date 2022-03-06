#******************************************************************************
# Copyright (C) 2017 by Alex Fosdick - University of Colorado
#
# Redistribution, modification or use of this software in source or binary
# forms is permitted as long as the files maintain this copyright. Users are 
# permitted to modify this and use it to learn about the field of embedded
# software. Alex Fosdick and the University of Colorado are not liable for any
# misuse of this material. 
#
#*****************************************************************************

#------------------------------------------------------------------------------
# <Make file capabale of compiling for different targets such as host linux and target cpu>
#
# Use: make [TARGET] [PLATFORM-OVERRIDES]
#
# Build Targets:
#      <supported targets are linux and bare metal>
#
# Platform Overrides:
#      <platform overrides are defined as PLATFORM=HOST & PLATFORM=MSP432>
#
#------------------------------------------------------------------------------
include sources.mk

# Platform Overrides
PLATFORM =
Basename = FinalBuild
TARGET = $(Basename).out

ifeq ($(PLATFORM),HOST)

	# Compiler Flags and Defines
CC = gcc
LDFLAGS = -Wl,-Map=$(Basename).map
CFLAGS = -Wall -Werror -O0 -g -std=c99
CPPFLAGS = -E
	#pattern matching target for binary(object) files
%.o : %.c
	$(CC) -D$(PLATFORM) $(CFLAGS) $(INCLUDES) -c $< -o $@
	
%.i : %.c
	$(CC) -D$(PLATFORM) $(CFLAGS) $(INCLUDES) $(CPPFLAGS) $< -o $@

%.asm : %.c
	$(CC) -D$(PLATFORM) $(CFLAGS) $(INCLUDES) -S $< -o $@

.PHONY : compile-all
compile-all : $(aSOURCES:.c=.o)
%.o : $(aSOURCES)
	$(CC) -D$(PLATFORM) $(CFLAGS) $(INCLUDES) -c $< -o $@

.PHONY : Build
Build : $(aSOURCES)
	$(CC) -D$(PLATFORM) $(CFLAGS) $(INCLUDES) $(aSOURCES) $(LDFLAGS) -o $(TARGET)

else

#Target
Basename = FinalBuild
Target = $(Basename).out

# Architectures Specific Flags
LINKER_FILE = -Tmsp432p401r.lds 
CPU = cortex-m4
ARCH = armv7e-m
SPECS = nosys.specs

# Compiler Flags and Defines
CC = arm-none-eabi-gcc
LD = arm-none-eabi-ld
LDFLAGS = -Wl, -Map=$(Basename).map
CFLAGS = -mcpu=$(CPU) -march=$(ARCH) --specs=$(SPECS) -Wall -g -std=c99 -Werror -O0

#Pattern matching  target
%.i : %.c
	$(CC) $(LINKER_FILE) -D$(PLATFORM) $(INCLUDES) $(CFLAGS) -E $< -o $@
%.asm : %.c
	$(CC) $(LINKER_FILE) -D$(PLATFORM) $(INCLUDES) $(CFLAGS) -S $< -o $@
%.o : %.c
	$(CC) $(LINKER_FILE) -D$(PLATFORM) $(INCLUDES) $(CFLAGS) -c $< -o $@

.PHONY: compile-all
compile-all : $(aSOURCES:.c=.o)
%.o : $(aSOURCES)
	$(CC) $(LINKER_FILE) -D$(PLATFORM) $(INCLUDES) $(CFLAGS) -c $< -o $@

.PHONY: Build
Build : $(aSOURCES)
	$(CC) $(INCLUDES) $(LINKER_FILE) -D$(PLATFORM) $(CFLAGS) $(aSOURCES) -o $(Target)
endif

.PHONY : clean
clean :
	rm -f $(aSOURCES:.c=.o)  $(aSOURCES:.c=.i) $(aSOURCES:.c=.asm) $(Target) $(Basename).map $(Basename).out
# Architectures Specific Flags
#LINKER_FILE = 
#CPU = 
#ARCH = 
#SPECS = 

# Compiler Flags and Defines
#CC = gcc
#LD = 
#LDFLAGS = 
#CFLAGS = 
#CPPFLAGs = -E

