maca=$1
func=$2
timeout 15 gatttool -b $maca --char-write-req -a 0x0411 -n $func --listen

#4000: set auto mode
#4040: set manual mode
#40+configurating bytes: set vacation mode
#43: switch to comfort-temperatures
#44: switch to eco-temperatures
#41+configurating byte: set temperature
#45ff: activate boost mode
#4500: stop boost mode
#2002: read timer for certain day (adapt 2nd byte)


#read more on https://github.com/Heckie75/eQ-3-radiator-thermostat/blob/master/eq-3-radiator-thermostat-api.md
