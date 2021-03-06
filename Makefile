#  Copyright 2010-2011 Stephen Dennis 
#
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

CC=gcc
CFLAGS=-Wall
INCLUDE=-I /usr/local/cuda/include
LIB=-ldl

platform := $(shell uname -s)

ifeq ($(platform),Darwin)
LIB += -Wl,-rpath,/usr/local/cuda/lib
endif

all: cuda_sensor

cuda_sensor: cuda_sensor.c
	$(CC) $(CFLAGS) $(INCLUDE) -rdynamic -o cuda_sensor cuda_sensor.c $(LIB)

clean:
	rm -f *.o cuda_sensor
