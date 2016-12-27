# verifica che non ci siano termini inutili nel glossario

echo "termini inutilizzati:"
cat terminiGlossario.tex | grep name\= | while read -r MATCH ; do
	MATCH=`echo $MATCH | sed 's/name={//' | sed 's/},//'`
	OK=`grep -i "gloss{${MATCH}}" ../../*/*/*.tex`
	if [[ ! $OK ]]; then
		echo "${MATCH}"
	fi
done
