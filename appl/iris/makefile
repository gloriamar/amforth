# Author: 
# Gloria Martorella <gloria.martorella@unipa.it>
# DICGIM - University of Palermo - Italy
# Viale delle Scienze - Ed. 6, 90128 Palermo, Italy

# Date: 2014
# License: General Public License (GPL) Version2 from 1991.

# Makefile for building the template project on Iris Mote. 


SHELL=/bin/bash
TARGET=iris

#AMFORTH=../../releases/3.6
AMFORTH=../../core

# Settings for Iris mote
MCU=atmega1281
LFUSE=0xff
HFUSE=0x19
EFUSE=0xff

# serial port
CONSOLE=/dev/ttyUSB0

# directories
DIR_ATMEL=../../Atmel

# programms / flags
USB=-c mib510  -P /dev/ttyUSB0
PP=-c stk200  -P /dev/parport0
JTAG=-V -c jtagmkII -P /dev/ttyUSB2
BURNER=$(JTAG)
AVRDUDE=avrdude
AVRDUDE_FLAGS=$(BURNER) -p $(MCU)



AVRASM=wine $(DIR_ATMEL)/avrasm2.exe -I $(DIR_ATMEL)/Appnotes2

# ----------------------------------------------------------

INCLUDE=-I $(AMFORTH) -I $(AMFORTH)/devices/$(MCU) 

default:  $(TARGET).hex

erase:
	$(AVRDUDE) $(AVRDUDE_FLAGS) -e

install: $(TARGET).hex
	$(AVRDUDE) $(AVRDUDE_FLAGS)  -e -U flash:w:$(TARGET).hex:i -U eeprom:w:$(TARGET).eep.hex:i

$(TARGET).hex: $(TARGET).asm $(AMFORTH)/*.asm $(AMFORTH)/words/*.asm $(AMFORTH)/devices/$(MCU)/*.asm dict_appl.inc 

	$(AVRASM) $(INCLUDE) -fI -v0 -e $(TARGET).eep.hex -l $(TARGET).lst $(TARGET).asm

$(TARGET).back:
	$(AVRDUDE) $(AVRDUDE_FLAGS)  -U flash:r:$(TARGET).hex:i -U eeprom:r:$(TARGET).eep.hex:i

clean:
	rm -f $(TARGET).hex
	rm -f $(TARGET).eep.hex
	rm -f $(TARGET).lst
	rm -f $(TARGET).map
	rm -f $(TARGET).cof
	rm -f $(TARGET).obj

read-fuse:
	$(AVRDUDE) $(AVRDUDE_FLAGS) -U hfuse:r:-:h -U lfuse:r:-:h -U lock:r:-:h
	

write-fuse:
	$(AVRDUDE) $(AVRDUDE_FLAGS) -U hfuse:w:$(HFUSE):m -U lfuse:w:$(LFUSE):m
