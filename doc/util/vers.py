#!/usr/bin/env python3

import os

def main():
    new_cmd = '\\newcommand{{{}}}{{\\emph{{\\mbox{{{}}}}}}}\n'
    macros = [
        ('\\NdP', 'Norme_di_'),
        # mancano i verbali
        ('\\AdR', 'Analisi'),
        ('\\SdF', 'Studio'),
        ('\\PdP', 'Piano_di_progetto'),
        ('\\PdQ', 'Piano_di_qualifica'),
        ('\\Glossario', 'Glossario'),
        ('\\ST', 'Specifica_tecnica'),
        ('\\DdP', 'Definizione_di_'),
        ('\\MU', 'Manuale_'),
    ]
    vers = open('hx-vers.sty', 'w')
    vers.write('% Ultime versioni dei documenti\n')
    vers.write('% da usare tramite il comando \\input{../../util/hx-vers}\n')
    vers.write('% da aggiornare con il comando ./vers.py dalla directory util\n\n')
    documents = os.listdir('..')
    for d in [f for dp, dn, fn in os.walk(os.path.expanduser('..')) for f in fn]:
        for m in macros:
            if d.startswith(m[1]) and d.endswith('.tex'):
                vers.write(new_cmd.format(m[0], d))
                macros.remove(m)
    vers.close()

if __name__ == '__main__':
    main()
