day=$1
dati=$2

if [ $day == "mon" ]; then
    dayhex=01
fi

timi=$(echo $dati | cut -d/ -f1)
tempi=$(echo $dati | cut -d/ -f2)

timhex=$(echo "$(echo $timi | cut -d: -f1 ) * 6" |bc)
timhex=$(echo "obase=16; $timhex" | bc)

temphex=$(echo "$tempi * 2" | bc)
temphex=$(echo "obase=16; $temphex" | bc)

echo $dayhex $timhex $temphex 

