# implementa la paginazione alfabetica del glossario:
alfabeto='a b c d e f g h i j k l m n o p q r s t u v w x y z'
for c in $alfabeto; do
	cat terminiGlossario.tex | sed 's/item\[a/a/'
done
