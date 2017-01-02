# Script di shell che aggiorna util/hx-vers.sty fornendogli i nomi dei documenti con l'ultima versione disponibile
# da invocare tramite il comando ./versioni.sh dalla directory doc

echo -n "" > util/hx-vers.sty
echo "% Ultime versioni dei documenti" >> util/hx-vers.sty
echo "% da usare tramite il comando \input{../../util/hx-vers}" >> util/hx-vers.sty
echo "% da aggiornare con il comando ./versioni.sh (dalla cartella doc)" >> util/hx-vers.sty
echo "" >> util/hx-vers.sty



echo -n "\newcommand{\NdP}{\emph{" >> util/hx-vers.sty
OUTPUT="$(basename Interni/*/Norme*.tex | sed 's/\(.*\)\..*/\1/' | sed 's/_/\\_/g')"
echo "${OUTPUT}.pdf}}" >> util/hx-vers.sty

echo -n "\newcommand{\Verbali}{\emph{" >> util/hx-vers.sty
OUTPUT="$(basename Esterni/*/Verbali*.tex | sed 's/\(.*\)\..*/\1/' | sed 's/_/\\_/g')"
echo "${OUTPUT}.pdf}}" >> util/hx-vers.sty

echo -n "\newcommand{\AdR}{\emph{" >> util/hx-vers.sty
OUTPUT="$(basename Esterni/*/Analisi*.tex | sed 's/\(.*\)\..*/\1/' | sed 's/_/\\_/g')"
echo "${OUTPUT}.pdf}}" >> util/hx-vers.sty

echo -n "\newcommand{\SdF}{\emph{" >> util/hx-vers.sty
OUTPUT="$(basename Interni/*/Studio*.tex | sed 's/\(.*\)\..*/\1/' | sed 's/_/\\_/g')"
echo "${OUTPUT}.pdf}}" >> util/hx-vers.sty

echo -n "\newcommand{\PdP}{\emph{" >> util/hx-vers.sty
OUTPUT="$(basename Esterni/*/Piano_di_progetto*.tex | sed 's/\(.*\)\..*/\1/' | sed 's/_/\\_/g')"
echo "${OUTPUT}.pdf}}" >> util/hx-vers.sty

echo -n "\newcommand{\PdQ}{\emph{" >> util/hx-vers.sty
OUTPUT="$(basename Esterni/*/Piano_di_qualifica*.tex | sed 's/\(.*\)\..*/\1/' | sed 's/_/\\_/g')"
echo "${OUTPUT}.pdf}}" >> util/hx-vers.sty

echo -n "\newcommand{\Glossario}{\emph{" >> util/hx-vers.sty
OUTPUT="$(basename Esterni/*/Glossario*.tex | sed 's/\(.*\)\..*/\1/' | sed 's/_/\\_/g')"
echo "${OUTPUT}.pdf}}" >> util/hx-vers.sty

if [[ -f Esterni/*/Specifica_tecnica*.tex ]]; then
echo -n "\newcommand{\ST}{\emph{" >> util/hx-vers.sty
OUTPUT="$(basename Esterni/*/Specifica_tecnica*.tex | sed 's/\(.*\)\..*/\1/' | sed 's/_/\\_/g')"
echo "${OUTPUT}.pdf}}" >> util/hx-vers.sty
fi

if [[ -f Esterni/*/Definizione*.tex ]]; then
echo -n "\newcommand{\DdP}{\emph{" >> util/hx-vers.sty
OUTPUT="$(basename Esterni/*/Definizione*.tex | sed 's/\(.*\)\..*/\1/' | sed 's/_/\\_/g')"
echo "${OUTPUT}.pdf}}" >> util/hx-vers.sty
fi

if [[ -f Esterni/*/Manuale*.tex ]]; then
echo -n "\newcommand{\MU}{\emph{" >> util/hx-vers.sty
OUTPUT="$(basename Esterni/*/Manuale*.tex | sed 's/\(.*\)\..*/\1/' | sed 's/_/\\_/g')"
echo "${OUTPUT}.pdf}}" >> util/hx-vers.sty
fi
