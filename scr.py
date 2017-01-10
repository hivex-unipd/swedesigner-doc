import re

g = open("terminiGlossario.tex", "r")
a = g.readlines()
g.close()
files = ["../Analisi_dei_requisiti/Analisi_dei_requisiti_0_0_0.tex",
"../Piano_di_progetto/Piano_di_progetto_v_0_0_5.tex",
"../Piano_di_qualifica/Piano_di_qualifica_0_0_0.tex",
"../../Interni/Norme_di_progetto/Norme_di_progetto_0_0_5.tex",
"../../Interni/Studio_di_fattibilita/Studio_di_fattibilita_0_0_1.tex"]


for x in a: # per ogni elemento nel glossario
	fine = a[0].find(']')
	parola = x[6:fine]
	
	for f in files:
		mf = open(f,"r")
		mff = mf.readlines()
		words = [] 
		i = 0
		for y in mff:
			i+=1
			z = re.split(" |.|,|(|)|'|", y)
			for el in z:
				words.append([el, i])
			print z
		print words[i]
		for i in range(len(words)):
			if (len(words[i])!=0 and words[i][0].lower() == parola.lower()):
				print(parola + " alla riga " + str(words[i][1]) + "non ha il tag gloss nel file " + f)
		mf.close()
			


