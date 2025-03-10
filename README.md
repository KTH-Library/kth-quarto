# KTH Quarto Formats

[Quarto®](https://quarto.org) is an open-source scientific and technical publishing system

- Publish reproducible, production quality articles, presentations, dashboards, websites, blogs, and books in HTML, PDF, MS Word, ePub, and more.
- Author using Jupyter notebooks or with plain text markdown in your favorite editor.
- Create dynamic content with Python, R, Julia, and Observable.

This repository provides a quarto extension which provides a couple of different KTH branded formats along with [starter templates](https://quarto.org/docs/extensions/starter-templates.html).

## Installing

```bash
quarto use template kth-library/kth-quarto
```

This will install the extension and create an example qmd file that you can use as a starting place for authoring your content (HTML article, PDF / typst output or web slides / revealjs output).

## Examples

Minimal sample document (HTML): [example.qmd](example.qmd), rendered to [example.html](https://kth-library.github.io/kth-quarto/example.html)

Sample with more features including a styled plot: [report.qmd](report.qmd), rendered to [report.html](https://kth-library.github.io/kth-quarto/report.html)

Web slides template: [slides.qmd](slides.qmd), rendered to [slides.html](https://kth-library.github.io/kth-quarto/slides.html)

PDF (Typst) sample doc: [typst-template.qmd](typst-template.qmd), rendered to [typst-template.pdf](https://kth-library.github.io/kth-quarto/typst-template.pdf)


