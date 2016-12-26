# Script di shell che aggiorna util/vers.sty fornendogli i nomi dei documenti con l'ultima versione disponibile
# da invocare tramite il comando ./versioni.sh dalla directory doc

echo -n "" > util/vers.sty

echo -n "\newcommand{\NdP}{" >> util/vers.sty
basename Interni/*/Norme*.tex | sed 's/\(.*\)\..*/\1/' | xargs echo -n >> util/vers.sty
echo "}" >> util/vers.sty

echo -n "\newcommand{\Verbali}{" >> util/vers.sty
basename Esterni/*/Verbali*.tex | sed 's/\(.*\)\..*/\1/' | xargs echo -n >> util/vers.sty
echo "}" >> util/vers.sty

echo -n "\newcommand{\SdF}{" >> util/vers.sty
basename Interni/*/Studio*.tex | sed 's/\(.*\)\..*/\1/' | xargs echo -n >> util/vers.sty
echo "}" >> util/vers.sty

echo -n "\newcommand{\PdP}{" >> util/vers.sty
basename Esterni/*/Piano_di_progetto*.tex | sed 's/\(.*\)\..*/\1/' | xargs echo -n >> util/vers.sty
echo "}" >> util/vers.sty

echo -n "\newcommand{\PdQ}{" >> util/vers.sty
basename Esterni/*/Piano_di_qualifica*.tex | sed 's/\(.*\)\..*/\1/' | xargs echo -n >> util/vers.sty
echo "}" >> util/vers.sty

echo -n "\newcommand{\Glossario}{" >> util/vers.sty
basename Esterni/*/Glossario*.tex | sed 's/\(.*\)\..*/\1/' | xargs echo -n >> util/vers.sty
echo "}" >> util/vers.sty
