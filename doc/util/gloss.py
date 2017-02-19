#!/usr/bin/env python3

import re   # regular expressions
import sys  # system utilities
import os   # os utilities



def main():
    glossary = get_glossary('../Esterni/Glossario/terminiGlossario.tex')
    if len(sys.argv) == 1:
        for f in get_files('../', exclude=['util/', 'diario.tex', 'Lettere/', 'Glossario/']):
            print(f)
    else:
        mark_file(sys.argv[1], glossary)



def get_files(base='.', ext='.tex', exclude=[]):
    """Return a list of files in the directory tree from <base> with extension <ext>."""
    result = []
    for root, dirs, files in os.walk(base):
        for f in files:
            if f.endswith(ext) and all(e not in os.path.join(root, f) for e in exclude):
                result.append(os.path.join(root, f))
    return result



def get_glossary(file):
    """Return a list with the glossary from the Latex file."""
    file = open(file, 'r')
    text = file.read()
    file.close()
    pattern = re.compile(r'\\item\[([^\]]+)\]')
    glossary = pattern.findall(text)
    return [pattern.sub(r'\1', g) for g in glossary]



def mark_file(file, glossary, start='\gloss{', end='}'):
    """For each glossary term, mark its first occurrence in the file and update the file.

    For each word in the given glossary, mark the first occurrence of it in the file with the start and end tags; then, update the file.
    """
    fhandle = open(file, 'r')
    text = fhandle.read()
    fhandle.close()
    output = mark_text(text, glossary, start, end)
    fhandle = open(file, 'w')
    fhandle.write(output)
    fhandle.close()



def mark_text(text, glossary, start='\gloss{', end='}'):
    """For each glossary term, mark its first occurrence in the text and return the text.

    For each word in the given glossary, mark the first occurrence of it in the text with the start and end tags; then, return the string.
    """
    text = reset_text(text, start, end)
    for g in glossary:
        text = text.replace(g, start + g + end, 1)
    return text



def reset_text(text, start='\gloss{', end='}'):
    """Strip the text from leading and trailing glossary markers."""
    start = start.replace('\\', '\\\\')
    end = end.replace('\\', '\\\\')
    pattern = re.compile(start + r'([^}]+)' + end)
    return pattern.sub(r'\1', text)



if __name__ == '__main__':
    main()
