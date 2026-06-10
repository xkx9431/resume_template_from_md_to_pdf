# Markdown Resume Template

A minimal, opinionated template for writing your resume in **Markdown** and exporting a print-ready **A4 PDF**.

- Bilingual skeletons: `resumes/resume.en.md` and `resumes/resume.cn.md`
- Shared print stylesheet: `styles/print.css`
- One-command PowerShell export: `scripts/export-md-pdf.ps1`

> The skeleton files contain `<!-- TODO -->` comments. Fill them in, then export.

---

## Quick start

### 1. Prerequisites

- [Node.js](https://nodejs.org/) 18+ (for `npx`)
- PowerShell 5.1+ (Windows) or PowerShell 7+ (cross-platform)
- A modern Chromium browser is downloaded automatically by `md-to-pdf` on first run

No global install required &mdash; the script uses `npx --yes md-to-pdf`.

### 2. Fill in your content

Open one of the skeletons and replace every `<!-- TODO: ... -->` block with your own text:

- English: [resumes/resume.en.md](resumes/resume.en.md)
- Chinese: [resumes/resume.cn.md](resumes/resume.cn.md)
- Sample filled output (English): [resumes/resume.en.sample.md](resumes/resume.en.sample.md)

Optionally drop a square avatar at `assets/avatar.jpg` (or update the image path in the Markdown).

### 3. Export to PDF

From the repo root:

```powershell
./scripts/export-md-pdf.ps1 -MdFile "resumes/resume.en.md"
```

This writes `resumes/resume.en.pdf` next to the source file. Use `-OutputBase` to control the output filename:

```powershell
./scripts/export-md-pdf.ps1 -MdFile "resumes/resume.cn.md" -OutputBase "Zhang_San_CV"
```

To export the sample-filled English resume:

```powershell
./scripts/export-md-pdf.ps1 -MdFile "resumes/resume.en.sample.md" -OutputBase "Alex_Chen_CV"
```

Use `-CssFile` to pass a custom stylesheet:

```powershell
./scripts/export-md-pdf.ps1 -MdFile "resumes/resume.en.md" -CssFile "styles/print.css"
```

---

## Repository layout

```text
.
├── README.md                 # this file
├── LICENSE                   # MIT
├── .gitignore
├── package.json              # optional: pins md-to-pdf, exposes npm scripts
├── assets/
│   ├── README.md             # where to put your photo
│   └── avatar.placeholder.svg
├── resumes/
│   ├── resume.en.md          # English skeleton
│   └── resume.cn.md          # Chinese skeleton
├── scripts/
│   └── export-md-pdf.ps1     # PowerShell export wrapper
└── styles/
    └── print.css             # A4 print stylesheet
```

---

## Customizing the layout

- Edit [styles/print.css](styles/print.css) to change margins, fonts, colors, or avatar size.
- Page size is locked to A4 via `@page { size: A4; margin: 14mm 12mm; }`.
- The CJK font stack (`Microsoft YaHei`, `PingFang SC`, `Noto Sans CJK SC`) renders both English and Chinese well.

---

## Tips

- Keep each bullet on **one line** in Markdown so it stays on one line in the PDF.
- Use `<!-- page-break -->` style HTML comments only if your renderer supports them; otherwise let the CSS `page-break-inside: avoid` do its work.
- The script also writes a `*.print.pdf` copy so you can keep one for printing and another for sharing.

---

## Instructions summary (this template)

Use this checklist when editing or exporting resumes in this repo:

- Start from a skeleton file and replace all `<!-- TODO: ... -->` placeholders.
    - English template: [resumes/resume.en.md](resumes/resume.en.md)
    - Chinese template: [resumes/resume.cn.md](resumes/resume.cn.md)
- If you want a ready reference, use the filled sample:
    - Sample output (English): [resumes/resume.en.sample.md](resumes/resume.en.sample.md)
- Keep existing HTML classes such as `resume-avatar` and `resume-header` so print styles apply correctly.
- Avatar behavior:
    - The avatar is styled to stay at the top-right in print output.
    - Default image path in templates is `../assets/avatar.placeholder.svg`; replace with your own image if needed.
- Export command (from repo root):

```powershell
./scripts/export-md-pdf.ps1 -MdFile "resumes/resume.en.md"
```

- Export sample output:

```powershell
./scripts/export-md-pdf.ps1 -MdFile "resumes/resume.en.sample.md" -OutputBase "Alex_Chen_CV"
```

- Output files are generated beside the source markdown as both `.pdf` and `.print.pdf`.

---

## License

[MIT](LICENSE) &mdash; free to use, modify, and share. Attribution appreciated but not required.
