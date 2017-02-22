#!/usr/bin/env python3

import re   # regular expressions
import sys  # system utilities
import os   # os utilities



def main():
    glossary = get_glossary('../Esterni/Glossario/terminiGlossario.tex')
    if len(sys.argv) == 1:
        for f in get_files('../', exclude=['util/', 'diario.tex', 'Lettere/', 'Glossario/']):
            mark_file(f, glossary)
    else:
        mark_file(sys.argv[1], glossary)



def get_files(base='.', exclude=[]):
    """Return a list of TeX files in the directory tree starting from <base>."""
    result = []
    for root, dirs, files in os.walk(base):
        for f in files:
            if f.endswith('.tex') and all(e not in os.path.join(root, f) for e in exclude):
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

    For each word in the given glossary, mark the first occurrence of it in the given TeX file with the start and end tags; then, update the file.
    """
    output = []
    f = open(file, 'r')
    text = f.read()
    output.append(mark_text(text, glossary, start, end))
    f.close()

    f = open(file, 'w')
    for line in output:
        f.write(line)
    f.close()



def mark_text(text, glossary, start='\gloss{', end='}'):
    """For each glossary term, mark its first occurrence in the text and return the text.

    For each word in the given glossary, mark the first occurrence of it in the given TeX text with the start and end tags; then, return the string.
    """
    text = reset_text(text, start, end)
    start = start.replace('\\', '\\\\')
    end = end.replace('\\', '\\\\')
    for g in glossary:
        pattern = re.compile(r'\b' + g + r'\b') # trovare un modo per ignorare i commenti LaTeX
        text = pattern.sub(start + g + end, text, 1)
    return text



def reset_text(text, start='\gloss{', end='}'):
    """Strip the text from leading and trailing glossary markers."""
    start = start.replace('\\', '\\\\')
    end = end.replace('\\', '\\\\')
    pattern = re.compile(start + r'([^}]+)' + end)
    return pattern.sub(r'\1', text)



if __name__ == '__main__':
    main()
