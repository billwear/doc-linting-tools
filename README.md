# `doc-linting-tools`

A lightweight, command-line toolchain for linting Markdown documentation — spellchecking, grammar, style, and broken links — built from battle-tested UNIX tools. These scripts are optimized for Markdown and automatically ignore fenced code blocks where appropriate.

> ⚠️ Provided as-is, with no warranty expressed or implied. Licensed under the [GNU Affero GPL v3.0](https://www.gnu.org/licenses/agpl-3.0.html).

---

## 🔍 What Is This?

This repo provides simple shell wrappers around standard CLI tools to help writers catch spelling, grammar, clarity, and link issues in Markdown docs. The main components are:

* `dc-spell` – Spellcheck via `aspell`, codeblock-aware
* `dc-linkchecker` – Link verification using `linkchecker`
* `dc-proselint` – Grammar/style analysis using `proselint`, codeblock-aware
* `dc-style` – Writing style metrics using `style`, with readability thresholds

All tools can be run individually or combined using the master script:

* `dcheck` – Orchestrates all checks in order from easiest to hardest to fix

---

## 🧰 What’s in the Repo?

| File                                   | Description                                                    |
| -------------------------------------- | -------------------------------------------------------------- |
| `dcheck`                               | Master script — runs all linters in sequence                   |
| `dc-spell`                             | Spellcheck wrapper for `aspell`; skips code blocks             |
| `dc-linkchecker`                       | Link checker for Markdown via `linkchecker`                    |
| `dc-proselint`                         | Wrapper for `proselint`; skips code blocks                     |
| `dc-style`                             | Wrapper for `style`; checks Flesch score and passive voice     |
| `install-deps.sh`                      | Installs all required tools via `apt`                          |
| `plist.aws`                            | Aspell personal dictionary (must be paired with a `.per` file) |
| `avail-tools`                          | Survey of linter tools evaluated for this project              |
| `emojis.org`                           | Emoji references for terminal output formatting                |
| `sampledoc`, `sampledoc.md`, `testdoc` | Test documents of varying complexity                           |
| `README.md`                            | This file                                                      |

---

## 🧠 Why Use This?

* You're writing technical docs and want fast, readable feedback
* You want to integrate grammar and style checking into a CLI or CI/CD workflow
* You value tools that respect Markdown structure and ignore irrelevant code blocks

---

## 💡 Recommended Companion Tool: `diction`

We recommend installing [`diction`](https://www.gnu.org/software/diction/) as well. It flags vague or wordy phrasing by highlighting questionable phrases:

```bash
echo "You can find it under the Network tab." | diction
```

Might return:

```
[You can] find...
```

More direct version:

> “Find it under the Network tab.”

Add any helpful CLI tools you discover to this repo — just update the scripts and the README accordingly!

---

## ⚙️ Installation

If you're using a Debian-based system:

```bash
./install-deps.sh
```

This installs:

* `aspell`
* `diction`
* `proselint`
* `pandoc`
* `linkchecker`

> ⚠️ You must still provide a properly formatted personal dictionary for `aspell`, named `plist.per`, placed in your `$HOME` directory. See `man aspell` for format details.

---

## 🚀 Usage

You can run the tools individually:

```bash
./dc-spell yourfile.md
./dc-proselint yourfile.md
```

Or run them all with:

```bash
./dcheck yourfile.md
```

`dcheck` runs the following in sequence:

1. **Spelling** (`dc-spell`)
2. **Links** (`dc-linkchecker`)
3. **Grammar/style** (`dc-proselint`)
4. **Readability & passive voice** (`dc-style`)

The script stops on the first failure (`set -e`), so you can focus on one issue at a time.

---

## 🛠️ Known Caveats

1. **`aspell`** requires a properly formatted `.per` file (not just `.aws`) or it will silently fail.
2. **`style`** reports only two thresholds:

   * Flesch score: must be > 64
   * Passive voice: must be < 20%
3. When `style` fails, sentence statistics are shown to help locate readability issues.
4. Code blocks in Markdown are automatically ignored where possible.

---

## 🧪 TODOs and Future Improvements

* [ ] Add a default `plist.per` for MAAS documentation use
* [ ] Bundle `install-deps.sh` into a single `make install` workflow
* [ ] Auto-place `plist.per` in `$HOME` during install

Feel free to contribute these — or anything else that would make this repo more robust. PRs are always welcome.

---

## 🤝 Contributions

This project is a foundation, not a fortress. Improve it, remix it, and send your changes back upstream. Every writer who sharpens their docs with these tools is helping create clearer, more human technical writing.
