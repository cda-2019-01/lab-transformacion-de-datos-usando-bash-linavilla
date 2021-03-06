#Lab2
for file in $(find . -name '*.csv');
do
    fn="$(basename -- ${file})";
    i=0
    while read line || [ -n "$line" ];
    do
        if [ ${#line} -gt 1 ]
        then
            ((i++))
            cadenas=$(echo $line | tr "," "\n");
            upp=$(echo $line | head -c 1);
            for cad in $cadenas
            do
                if [[ "$cad" =~ ...:. ]]
                then
                    echo "$fn,$i,$upp,"$cad"";
                fi
            done
        fi
    done < $fn
done