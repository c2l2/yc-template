# research-repo-template
This is a template repository for c2l2 team (YC version).

Markdown is the canonical research memory in this repo. Keep research notes,
paper summaries, and meeting notes in Markdown so they stay local, searchable,
and easy for Codex to read.

## How to use this template
1. Click on the "Use this template" button at the top right of the page.
2. Fill in the repository name and description.
3. Click "Create repository from template".
4. Clone the repository to your local machine.
5. Start adding your research files and documentation.

## Repository structure
- `meeting-note.md`: the running meeting summary in Markdown.
- `references/`: paper PDFs and corresponding Markdown reading notes.
- `attachments/meetings/`: images referenced from `meeting-note.md`.
- `attachments/references/`: images pasted into paper reading notes.
- `data/raw/`: immutable source data.
- `data/processed/`: cleaned or transformed datasets.
- `data/temp/`: temporary outputs that can be regenerated.
- `data/code/`: data-processing scripts and notebooks.
- `finding/`: empirical work such as summary statistics, modeling, and simulation.
- `report/`: Markdown files that mostly link to external slides, docs, or reports.
- `deliverable/paper/`: the main paper draft and related manuscript files.
- `deliverable/slides/`: Beamer slides and presentation files.
- `templates/`: notebook and analysis templates for new projects.
- `yc-ai-assistant/`: shared AI workflow files and skills, tracked as a Git submodule.

See [專案資料夾規範](https://docs.google.com/document/d/1sl6gEFMdmiGsiNjLe17UmZ30xKxq15U0Mb2B-Jvusxg/edit?usp=sharing).

## Figure storage for Markdown
Use relative links only for note figures.

- `meeting-note.md` should reference files in `./attachments/meetings/`
- files inside `references/` should reference files in `../attachments/references/`

Suggested naming:
- dates as `YYYY-MM-DD`
- paper files as `author-year-short-title`
- no spaces in filenames

Examples:

```md
![Whiteboard sketch](./attachments/meetings/2026-03-14-proof-outline.png)
```

```md
![Figure from paper](../attachments/references/rust-1987/fig-1.png)
```

## Templates
`templates/` contains the Jupyter notebooks and R Markdown examples for common
research tasks in this repository.

## AI Template Updates
This template tracks the shared AI workflow in the `yc-ai-assistant/` submodule.
The AI update commands also sync a path-adjusted root `AGENTS.md` so agent tools
can discover the latest instructions from the repo root.

For future updates from the shared AI template repo:

```bash
make ai-template-setup
make ai-template-update
```
