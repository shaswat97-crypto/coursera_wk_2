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

# Add your Source files to this variable
ifeq ($(PLATFORM),HOST)
aSOURCES =\
	 memory.c\
	 main.c

else
aSOURCES =\
	 interrupts_msp432p401r_gcc.c\
	 system_msp432p401r.c\
	 startup_msp432p401r_gcc.c\
	 memory.c\
	 main.c

endif
SOURCES =\
	 ./interrupts_msp432p401r_gcc.c\
	 ./system_msp432p401r.c\
	 ./startup_msp432p401r_gcc.c\
	 ./memory.c\
	 ./main.c

# Add your include paths to this variable
INCLUDES = \
	   -I ~/ese-coursera-course1/assessments/m2/include/common\
	   -I ~/ese-coursera-course1/assessments/m2/include/msp432\
	   -I ~/ese-coursera-course1/assessments/m2/include/CMSIS\
	   -I ~/ese-coursera-course1/assessments/m2



