# mdword
A pandoc reference.docx so your Markdown stops turning into a Word document
that looks like it was made in 2009.
Also includes a few QOL things see install.sh and mdword they help a bit.

## The problem
We like Markdown. Sometimes the people we work with do not, and they want a
Word document. Fine, that's normal, that's life. The problem is that pandoc's
default Word output looks like the sad legacy blegh it is;
Times New Roman-ish fonts, a bare header underline, and tables with barely any style points at all.
If you hand that to a business person they will assume you are lazy, when really you just didn't pass `--reference-doc`.

Modern Word and Word Online have a clean, opinionated look out of the box.
This project is just a reference.docx built to match that look, so pandoc's
output actually looks like it came from the same century as your coworkers'
laptops.

## Usage
Using the reference doc is simple but annoying to type:

```bash
pandoc yourfile.md --reference-doc=reference.docx -f markdown-auto_identifiers -o yourfile.docx
```

That's it. That's the whole project, conceptually, just saving you ~15 minutes making this file.
Everything else in this repo is optional convenience on top of that one command.

The `-f markdown-auto_identifiers` part turns off automatic heading
bookmarks.
First nobody asked for these, second to the modern business person these are odd little flags next to every heading.

Want a table of contents too? Add `--toc`.

## Dependencies
Just [pandoc](https://pandoc.org). Use it its your friend.

You likely don't need the content below this if you're here but just in case...

```bash
brew install pandoc
```

Opening the resulting .docx just needs Word or Word Online, same as any other Word file.

## What's here
- `reference.docx` : the actual template. Open it in Word if you want to
  tweak fonts, colors, spacing, whatever. Pandoc only reads style
  definitions from it, not any content, so you never need to worry about
  leftover text sneaking into your output.
- `example.md` : a short, deliberately silly sample document that exercises
  headings, a table, nested lists, a blockquote, a code block, inline code,
  and a link, so you can see the whole style in one shot.

Run the usage command above against `example.md` if you want to see it for
yourself.

## Optional extras
This repo also ships a tiny `mdword` shell command and an `install.sh` that
puts it on your PATH, if you'd rather type `mdword report.md` than remember
the full pandoc invocation, solely because yeeeesh that is a long one. Totally optional but cute.
The reference.docx is the actual point of this project, the script is just a shortcut for people who
convert a lot of files and don't want to type the same flags every time.

Side note the attached README.docx was generated using the reference file and `mdword README.md`.
