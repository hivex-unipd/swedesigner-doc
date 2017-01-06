# verifica che il glossario non contenga termini inutili:
printf "\n\ntermini inutilizzati:\n"
cat terminiGlossario.tex | grep \\item | while read -r MATCH ; do
	MATCH=`echo $MATCH | sed 's/\\\item\[//' | sed 's/\].*//'`
	OK=false
	for f in ../../*/*/*.tex; do
		if [[ `grep -i "gloss{${MATCH}}" $f` ]]; then
			OK=true
		fi
	done
	if [ "$OK" = false ]; then
		echo -n "${MATCH}, "
	fi
done
echo -e "\b\b "



# verifica che al glossario non manchi qualche termine utilizzato:
# (l'opzione -w fornisce il path del file
# con il termine da inserire in glossario)
printf "\n\ntermini da inserire:\n"
for f in ../../*/*/*.tex; do
	cat $f | grep -o "gloss{.*}" | while read -r MATCH ; do
		MATCH=`echo $MATCH | sed 's/gloss{//' | sed 's/}.*//'`
		OK=false
		if [[ ! `grep -i "item\[${MATCH}\]" terminiGlossario.tex` ]]; then
			if [[ $1 = "-w" ]]; then
				echo "${MATCH} (${f})"
			else
				echo -n "${MATCH}, "
			fi
		fi
	done
done
echo -e "\b\b "
