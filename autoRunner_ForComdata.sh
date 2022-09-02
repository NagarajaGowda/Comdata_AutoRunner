#!/bin/bash
#developer basil ng
p=-externalId
command=.sh
count=1
if [ -f /tmp/$3 ]
then
        echo "The program is already running"
else
        touch /tmp/$3
        while IFS= read -r x; do
		y=`sed -n "$count"p $2`
                cd $y
                echo $x
                echo $y
                files=(`ls -l | grep "^-" | tr -s ' ' | cut -d ' ' -f 9`)
                if (( ${#files} ))
                then
                        pwd
                        for FILE in ${files[@]}
                        do
                                echo $FILE
                                if [[ -f $FILE ]]
                                then
                                        echo "Processing  $FILE"
                                        . /opt/ids/scripts/$3$command $p $x
                                        break
                                fi
                        done
                        echo "Done"
                fi
        count=`expr $count + 1`
        done < $1
        rm -rf /tmp/$3
fi
