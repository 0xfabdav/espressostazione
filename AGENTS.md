# AGENTS.md

## What this repo is now

- The working tree is a **static site**: `index.html` + `styles.css` + assets under `public/assets/`.
- There is currently **no `package.json`**, build pipeline, test suite, or CI config in the checked-out files.
- Older Astro/Supabase files are tracked in git history but are deleted in the current tree; do not reintroduce them unless explicitly asked.

## Fastest safe workflow

- For content/layout changes, edit `index.html` and `styles.css` directly.
- For quick local verification, serve the repo root with a simple static server (for example `python3 -m http.server`) and check the page in a browser.
- If only text/styles changed, visual verification is the primary check (no repo-native lint/typecheck/test commands to run).

## Structure that matters

- Main page markup and section IDs are in `index.html`; navigation anchors depend on those IDs.
- All styling is centralized in `styles.css` (CSS variables at top; responsive behavior in media queries near the bottom).
- Images are referenced from `public/assets/...`; keep paths stable when replacing assets.

## Content conventions to preserve

- Keep existing section order and anchor links (`#bar`, `#angebot`, `#tostino`, `#baristakurs`, `#zeiten`, `#kontakt`) unless a task explicitly changes IA.
