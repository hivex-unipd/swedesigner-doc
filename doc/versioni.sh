# Script di shell che aggiorna util/hx-vers.sty fornendogli i nomi dei documenti con l'ultima versione disponibile
# da invocare tramite il comando ./versioni.sh dalla directory doc

echo -n "" > util/hx-vers.sty

echo -n "\newcommand{\NdP}{" >> util/hx-vers.sty
basename Interni/*/Norme*.tex | sed 's/\(.*\)\..*/\1/' | sed 's/_/\\_/g' >> util/hx-vers.sty
echo "}" >> util/hx-vers.sty

echo -n "\newcommand{\Verbali}{" >> util/hx-vers.sty
basename Esterni/*/Verbali*.tex | sed 's/\(.*\)\..*/\1/' | sed 's/_/\\_/g' >> util/hx-vers.sty
echo "}" >> util/hx-vers.sty

echo -n "\newcommand{\SdF}{" >> util/hx-vers.sty
basename Interni/*/Studio*.tex | sed 's/\(.*\)\..*/\1/' | sed 's/_/\\_/g' >> util/hx-vers.sty
echo "}" >> util/hx-vers.sty

echo -n "\newcommand{\PdP}{" >> util/hx-vers.sty
basename Esterni/*/Piano_di_progetto*.tex | sed 's/\(.*\)\..*/\1/' | sed 's/_/\\_/g' >> util/hx-vers.sty
echo "}" >> util/hx-vers.sty

echo -n "\newcommand{\PdQ}{" >> util/hx-vers.sty
basename Esterni/*/Piano_di_qualifica*.tex | sed 's/\(.*\)\..*/\1/' | sed 's/_/\\_/g' >> util/hx-vers.sty
echo "}" >> util/hx-vers.sty

echo -n "\newcommand{\Glossario}{" >> util/hx-vers.sty
basename Esterni/*/Glossario*.tex | sed 's/\(.*\)\..*/\1/' | sed 's/_/\\_/g' >> util/hx-vers.sty
echo "}" >> util/hx-vers.sty
