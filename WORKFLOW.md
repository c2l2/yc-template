# Research Workflow

This repository uses Markdown as the canonical research memory.

The workflow is designed so that notes stay local and readable by Codex, while
the paper draft in `deliverable/paper/` becomes the main formal output over
time.

## Core Principles

- Markdown files store the working research memory.
- The most relevant LaTeX draft in `deliverable/paper/` usually contains the latest project context.
- Slides in `deliverable/slides/` should be derived from the paper draft rather than from scattered notes.
- Skills are used to support repeated workflows, not to replace the repo structure.

## Folder Roles

- `meeting-note.md`: running meeting summary and research coordination log
- `BACKLOG.md`: important but not urgent issues and follow-ups
- `references/`: paper PDFs and corresponding Markdown notes
- `attachments/meetings/`: images used by meeting notes
- `attachments/references/`: images used by paper notes
- `data/`: raw, processed, temporary, and code-related data work
- `finding/`: empirical analysis, modeling, and simulation work
- `report/`: Markdown files that point to external docs or reporting artifacts
- `deliverable/paper/`: main paper draft and manuscript files
- `deliverable/slides/`: Beamer slide decks and slide-related files
- `templates/`: reusable templates for analysis and simulation
- `skills/`: Codex workflow skills for repeated research tasks

## Research Pipeline

Typical project flow:

1. search papers
2. create or update notes in `references/`
3. log meetings and action items in `meeting-note.md`
4. log hourly progress and backlog items during active work
5. develop ideas with theory notes and discussion
6. run simulations or empirical checks in `finding/`
7. integrate stable material into `deliverable/paper/`
8. create slides from `deliverable/paper/`

Short version:

`search -> note -> discuss -> think -> simulate -> paper -> slides`

## Source of Truth by Stage

- Early-stage understanding: Markdown notes and meeting notes
- Theory development: discussion, notes, and the current draft in `deliverable/paper/`
- Simulation and numerical checking: `finding/`
- Formal project narrative: `deliverable/paper/`
- Presentation narrative: `deliverable/slides/`

## Skill Map

- `paper-search`: search literature and prioritize high-value papers
- `paper-note`: turn papers into structured Markdown notes in `references/`
- `meeting-log`: maintain `meeting-note.md`
- `hourly-progress-log`: record compact hourly updates and backlog-worthy issues
- `theory-workbench`: reason through assumptions, proof ideas, and gaps
- `simulation-runner`: design and inspect simulations, using R by default
- `chat-to-latex`: integrate current discussion into `deliverable/paper/` only when explicitly requested
- `beamer-slides`: create or revise Beamer slides using the paper draft as the main source

## Important Conventions

- Use relative links for figures in Markdown notes.
- For paper-note figures, store files in `attachments/references/`.
- For meeting-note figures, store files in `attachments/meetings/`.
- Use R by default for simulation work unless the project clearly uses another language.
- Before integrating text into `deliverable/paper/`, check notation consistency with the paper draft.
- For slide work, match the style of existing Beamer decks when possible.
- For literature search, prioritize higher-quality journals when ranking candidate papers.

## Practical Guidance for Agents

- Start from local files before relying on memory.
- Inspect `deliverable/paper/` whenever project context is needed and the task touches the paper.
- Keep notes concise and structured so they remain useful later.
- Do not treat exploratory notes as finished manuscript text.
- Do not treat slides as the main place for developing ideas.
