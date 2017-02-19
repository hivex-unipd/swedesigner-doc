import re

g = open("../Esterni/Glossario/terminiGlossario.tex", "r")
a = g.readlines()
g.close()
files = ["../Interni/Norme_di_progetto/Norme_di_progetto_1_0_0.tex","../Esterni/Analisi_dei_requisiti/Analisi_dei_requisiti_1_0_0.tex",
"../Esterni/Piano_di_progetto/Piano_di_progetto_1_0_0.tex",
"../Esterni/Piano_di_qualifica/Piano_di_qualifica_1_0_0.tex",
"../Interni/Studio_di_fattibilita/Studio_di_fattibilita_1_0_0.tex"]


for x in range(len(a)): # per ogni elemento nel glossario
	#print x
	fine = a[x].find(']')
	#print fine
	parola = a[x][6:fine]
	#print parola
	for f in files:
		mf = open(f,"r")
		mff = mf.readlines()
		words = []
		pos=[]
		i = 0
		for y in mff:
			i+=1
			#z = re.split("; |, | |( |) |\t |{ |} |\' |\*|\n", y)
			z=re.split("['.,;()\n\t ]",y)
			for el in z:
				words.append(el)
				pos.append(i)
			
			#print z
		cleaned = filter(None,words)
		#print cleaned
		for i in range(len(cleaned)):
			#print cleaned[i]
			if (cleaned[i].lower() == parola.lower()):
				print(parola + " alla riga " + str(pos[i]) + " non ha il tag gloss nel file " + f)
		mf.close()
			


