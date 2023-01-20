#!/bin/bash

num=$1

tamanyo=`echo $num | wc -c`
tamanyo=$((tamanyo-1))
max=$((tamanyo-1))

echo "El tamaño es $tamanyo"
echo "El ultimo elemento es el $max"

for i in `seq 0 $max`
  do 
    echo "${num:$i:1}"
    sleep 0.2
  done

if [[ $num =~ ^[IVXLCDM]*$ ]];
  then
    decimal=$(echo "o=10; i=roman; $num" | bc)
    echo "El numero $num en decimal es $decimal"
elif [[ $num =~ ^[0-9]*$ ]];
  then
      if (( num < 1 || num > 1999 ));
         then
           echo "Error, el numero debe estar entre 1 y 1999"
         else
           romanos=( [1000]="M" [900]="CM" [500]="D" [400]="CD" [100]="C" 
                     [90]="XC" [50]="L" [40="XL" [10]="X" [9]="IX" [5]="V" 
                     [4]="IV" [1]="I" )
           roman=""
      for i in ${!romanos[@]};
      do
        while (( num >= i )); do
          roman+=${romanos[i]}
          (( num -= i ))
        done
      done
        echo "El numero $1 en romano es $roman"
      fi
      else
        echo "Error, el parametro debe ser un numero decimal o romano"
      fi