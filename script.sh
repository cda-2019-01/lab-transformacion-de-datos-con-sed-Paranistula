sed -e "s!/!-!g" data.csv > out.1
sed -e "s#^\([0-9]\)-#0\1-#" out.1 > out.2
sed -e "s#-\([0-9]\)-#-0\1-#" out.2 > out.3
sed -e "s-\([0-9][0-9]\)\-\([0-9][0-9]\)\-\([0-9][0-9]\)/20\3-\2-\1/g" out.3 > out.4 #agregar los dos primeros digitos del año y reordenar fecha
sed -e "s/;N;/;\\\N;/g" out.4 > out.5 #cambiar ;N; por ;\N
sed -e "s/;N/;\\\N/g" out.5 > out.6 #cambiar ;N por ;\N
sed -e "s/;;/;\\\N;/g" out.6 > out.7 #cambiar ;; por ;\N
sed -e "s/;0//g" out.7 > out.8 #cambiar ;0 por nada
sed -e "s/a/A/g" -e "s/c/C/g" out.8 > out.9 #cambiar a y c minuscula por A y C mayusculas
sed -e "s/,/./g" -e "s/;/,/g" out.9 > out.10 #cambiar , por . para indicar decimales y cambiar ; por , como separador
sed -e "s/,$/,\\\N/g" out.10 > out.11 #elimimar , del final del carril
sed -e "s/,\n,/,\\\N,/g" out.11 > out.12
sed '/\N/d' out.12 > Laboratorio1 #filtrar solo los datos que no contengan valores nulos (\N)
rm out.* #eliminar archivos out.*
