#!/bin/bash

rm cookies.txt

cp michalek-new.html michalek-old.html

rm michalek-new.html

wget http://michalek-beach.rezervuju.cz/training?event_group_id=35 --header="User-Agent: Mozilla/5.0 (Windows NT 5.1; rv:23.0) Gecko/20100101 Firefox/23.0" --keep-session-cookies --save-cookies cookies.txt

wget http://michalek-beach.rezervuju.cz/training?event_group_id=35 --header="User-Agent: Mozilla/5.0 (Windows NT 5.1; rv:23.0) Gecko/20100101 Firefox/23.0" --load-cookies cookies.txt -O michalek-new.html

#diff -u michalek-old.html michalek-new.html | grep -i HRA -B2 -A3 > michalek_diff.txt
###diff -u michalek-old.html michalek-new.html | grep -i HRA -B2 -A3 | grep -v \<td > michalek_diff.txt
diff -u michalek-old.html michalek-new.html | grep -i HRA -B2 -A3 | grep -v ^- | grep -v ^--- | grep -v ^@@ |  grep -v \<td | grep -v '[0-9]*\/[0-9]'  > michalek_diff1.txt


michalek_diff="michalek_diff.txt"
michalek_diff1="michalek_diff1.txt"

dt=`date '+%A %H:%M:%S %d %b %Y'`

###if [ -s  "$michalek_diff" ] ;

   ###     then

###		echo "patecni hra" | mail  -s "Patecni hra" -a From:Beach_Michalek\<zahradnickova.alarm@gmail.com\> magyarr@live.com < michalek_diff.txt
###
####                echo "patecni hra" | mail -s "Beach Michalek" magyarr@live.com < michalek_diff.txt
###                cat michalek_diff.txt
###                echo -------------------------------ZMENA--------------------------------------------------
###                echo $dt >> zmena_michalek.txt
###        else
###                echo -------------------------------ZADNA ZMENA-------------------------------------------
###                cat michalek_diff.txt
###
###
###        fi


if [ -s  "$michalek_diff1" ] ;

        then
	
		echo "patecni hra ONLY" | mail  -s "Patecni hra only" -a From:Beach_Michalek\<zahradnickova.alarm@gmail.com\> magyarr@live.com < michalek_diff1.txt 
              #  echo "patecni hra ONLY" | mail -s "Beach Michalek ONLY" magyarr@live.com < michalek_diff1.txt
                cat michalek_diff1.txt
                echo -------------------------------ZMENA--------------------------------------------------
                echo $dt >> zmena_michalek1.txt
        else
                echo -------------------------------ZADNA ZMENA-------------------------------------------
                cat michalek_diff1.txt


        fi



rm -- 'training?event_group_id=35'

