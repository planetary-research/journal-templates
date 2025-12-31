# Repository Guidelines

## Project Structure & Modules
- `planetary.cls`: main LaTeX class (submission/final). Edit cautiously and keep version/date header current.
- `manuscript.tex`: canonical manuscript template using `biblatex` + `biber`.
- `supplementary-materials.tex`: supplementary-material template aligned with the main class.
- `references.bib`: sample bibliography; duplicate/extend instead of replacing field names.
- Assets: `planet.png`, `cc.png`, `by.png`, `journal_logo.pdf` used in title blocks and footers. Keep file names stable.
- `readme.md`: high-level overview; update when class options or compile steps change.

## Build, Test, and Development Commands
- `pdflatex manuscript.tex && biber manuscript && pdflatex manuscript.tex && pdflatex manuscript.tex`: full build of the main template; expect a clean run without missing refs.
- `pdflatex supplementary-materials.tex`: compile supplementary material.
- Prefer `latexmk -pdf manuscript.tex` if available; ensure it calls `biber`.
- When editing `planetary.cls`, compile both templates to catch regressions in headers, spacing, and bibliography.

## Coding Style & Naming Conventions
- LaTeX: two-space indentation; one command per line for long option lists. Avoid tabs.
- Follow existing macro patterns; do not introduce `\newcommand`/`etoolbox` patches in manuscripts (per template guidance)—place shared macros in the class if truly general.
- Use descriptive macro names mirroring journal terminology (e.g., `\mstype`, `\affil`). Keep option names lowercase with hyphen-free tokens.
- Comments should be instructional and brief; remove obsolete placeholders in templates.

## Testing Guidelines
- Build the sample files after any change to `planetary.cls` or document structure; treat warnings about references, overfull boxes, or missing fonts as failures to fix.
- Verify bibliography flow with `biber`; ensure `\addbibresource{references.bib}` resolves and no duplicates appear.
- Check logo paths resolve on clean clones; do not rely on external assets or network resources.
- For layout tweaks, eyeball margins, headers/footers, and line numbering in both `final` and default review mode.

## Commit & Pull Request Guidelines
- Commits: use short, imperative subjects (`Adjust header spacing`, `Fix biber hook`). Group related class edits together; include brief body explaining user-facing impact (e.g., “restores margin in review mode”).
- Pull requests: summarize scope, list affected templates/options, and attach regenerated PDFs for `manuscript` and `supplementary-materials`. Note any breaking changes to option names or required packages.
- Reference related issues/requests and describe manual checks performed (commands run, warnings resolved). Keep diffs minimal—avoid reflowing unrelated LaTeX.
