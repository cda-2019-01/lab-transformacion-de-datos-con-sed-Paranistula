sed -e "s/\([0-9][0-9]\)\/\([0-9][0-9]\)\/\([0-9][0-9]\)/20\3-\2-\1/g" data.csv > out.2 #agregar los dos primeros digitos del año y reordenar fecha
sed -e "s/;N;/;\\\N;/g" out.2 > out.3 #cambiar ;N; por ;\N
sed -e "s/;N/;\\\N/g" -e "s/;n/;\\\N/g" -e "s/\\\n/\\\N/g" out.3 > out.4 #cambiar ;N por ;\N
sed -e "s/;;/;\\\N;/g" out.4 > out.5 #cambiar ;; por ;\N
sed -e "s/;0//g" out.5 > out.6 #cambiar ;0 por nada
sed -e "s/a/A/g" -e "s/c/C/g" out.6 > out.7 #cambiar a y c minuscula por A y C mayusculas
sed -e "s/,/./g" -e "s/;/,/g" out.7 > out.8 #cambiar , por . para indicar decimales y cambiar ; por , como separador
sed -e "s/,$/,\\\N/g" out.8 > out.9 #elimimar , del final del carril
sed '/\N/d' out.9 > Laboratorio1 #filtrar solo los datos que no contengan valores nulos (\N)
rm out.* #eliminar archivos out.*
