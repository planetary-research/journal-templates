# Planetary Research — Journal Templates

Official LaTeX class and other templates for submissions to *Planetary Research*. The default mode for the LaTeX class is **review** (line-numbered, 12pt); use **final** for a preprint-ready layout (11pt, right-aligned title/authors, adjusted margins).

## Preview
Screenshot of the compiled front page of the LaTeX submission file `submission-BIBLATEX.tex`:

![Front page preview](docs/frontpage.png)

Commands to compile from the command line (after installing LaTeX/ImageMagick):
```
pdflatex submission-BIBLATEX.tex && biber submission-BIBLATEX && pdflatex submission-BIBLATEX.tex && magick convert -density 180 submission-BIBLATEX.pdf[0] -quality 92 docs/frontpage.png
```

## Repository layout
- `planetary.cls` — journal class (v1.2, 27 Nov 2025).
- `manuscript.tex` — main manuscript template that uses `biblatex`/`biber`.
- `supplmentary-materials.tex` — supplementary material template matching the class defaults.
- `references.bib` — sample bibliography.
- `PR_template.docx` — docx/odt template.
- Assets: `journal_logo.pdf`, `planet.png`, `cc.png`, `by.png`.

## Quick start
1) Place `planetary.cls` in the same folder as your manuscript.  
2) Minimal preamble for LaTeX manuscript:
```latex
\documentclass{planetary} % add [final] for preprint
\addbibresource{references.bib}
\title{A concise title}
\author[1,*]{First Author\,\orcidlink{0000-0000-0000-0000}}
\affil[1]{Affiliation, City, Country}
\date{\today}
```
3) In the document body:
```latex
\mstype{Article}
```

## Build commands
- Full cycle (recommended):  
  `pdflatex submission-BIBLATEX.tex && biber submission-BIBLATEX && pdflatex submission-BIBLATEX.tex && pdflatex submission-BIBLATEX.tex`
- Supplementary material: `pdflatex SuppInfo.tex`
- If available, `latexmk -pdf submission-BIBLATEX.tex` is fine; ensure it calls `biber`.

## Class highlights
- **review** mode: line numbers enabled; 2.5 cm margins.
- **final** mode: left margin widened to 3.8 cm; title/authors flushed right; floats and captions right-aligned.
- Preloaded packages: `authblk`, `orcidlink`, `biblatex` (authoryear, `biber` backend), `lineno`, `geometry`, `fancyhdr`, `xcolor`, `tabularx`, `booktabs`, `graphicx`, `hyperref`.
- Provided helpers: `\keywords{...}`, `\mstype{...}`.

## Tips
- Keep logo filenames unchanged; they are referenced by the class (`journal_logo`).
- Avoid defining ad-hoc macros in manuscripts; prefer editing `planetary.cls` and making a pull request if a feature is needed.
- Treat warnings (missing references, overfull boxes) as failures to fix before submission.

## License and support
Released under the MIT License unless stated otherwise. For help, contact `tech@planetary-research.org`.
