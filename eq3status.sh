#timeout 15 gatttool -b 00:1A:22:08:D2:E3 --char-read -a 0x0321 --listen
#timeout 15 gatttool -b 00:1A:22:08:D2:E3 --char-read -a 0x0322 --listen

maca=$1

dat=$(date +%g-%m-%d-%H-%M-%S)
#echo $dat
for i in `seq 1 6`; do
    strp=$(echo "$dat"|cut -d- -f$i)
    hexi=$(echo "obase=16; $strp"|bc)
    if [ $strp -lt 16 ]; then hexi=$(echo 0$hexi); fi
    hexdat=$(echo $hexdat$hexi)
done

#echo $hexdat

statusR=$(timeout 5 gatttool -b $maca --char-write-req -a 0x0411 -n 03$hexdat --listen)
statusR=$(echo ${statusR^^} |grep -o ".................$"); #echo $statusR #if vacation-mode is active 3 more bytes are attached !!!

hexi=$(echo $statusR |cut -d" " -f3)
modo=$(echo "ibase=16; $hexi"|bc)
#echo $modo

hexi=$(echo $statusR |cut -d" " -f4)
valvo=$(echo "ibase=16; $hexi"|bc)

hexi=$(echo $statusR |cut -d" " -f6)
#echo $hexi
deco=$(echo "ibase=16; $hexi"|bc)
#echo $deco
tempo=$(echo "scale=1;$deco/2"|bc)

echo $modo $valvo $tempo

