sed 's/;\r$/;\\\N/g' data.csv > out.1 #Agregar \N al final de la linea
sed 's%/%-%g' out.1 > out.2 #cambiar / por -
sed -e "s#^\([0-9]\)-#0\1-#" out.2 > out.3 # Agregar el segundo digito al dia
sed -e "s#-\([0-9]\)-#-0\1-#" out.3 > out.4 # Agregar el segundo digito al mes
sed "s/-\([0-9][0-9]\);/-20\1;/" out.4 > out.5 # Agregar el 20 al inicio del año
sed -r 's|(..)-(..)-(....)|\3-\2-\1|' out.5 > out.6 # Cambiar las posiciones de DD-MM-AAAA por AAAA-MM-DD
sed -e "s/a/A/g" -e "s/c/C/g" -e "s/n/N/g" out.6 > out.7 #cambiar a, c y n minuscula por A, C y N mayusculas
sed -e "s/;N;/;\\\N;/g" out.7 > out.8 #cambiar ;N; por ;\N
sed -e "s/;N/;\\\N/g" out.8 > out.9 #cambiar ;N por ;\N
sed -e "s/;;/;\\\N;/g" out.9 > out.10 #cambiar ;; por ;\N
sed -e "s/;0//g" out.10 > out.11 #cambiar ;0 por nada
sed -e "s/,/./g" -e "s/;/,/g" out.11 > Laboratorio1 #cambiar , por . para indicar decimales y cambiar ; por , como separador
rm out.* #eliminar archivos out.*
cat Laboratorio1 # Imprimir el resultado en Laboratorio1