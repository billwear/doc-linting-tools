# doc-linting-tools

These doc linting tools are provided AS IS, no warranty expressed or implied.  Licenses under the GNU GPL v3.0 "Affero" license.

## What's here

- avail-tools: a survey of available tools considered for this repo, in case you wondered what was examined (or not).
- dcheck: the master linting program; runs all the other tools in a sequence of easiest to fix vs. hardest to fix.
- dc-linkchecker: a script surrounding the linkchecker tool.
- dc-proselint: a script surrounding the Python proselint tool; strips codeblocks before checking.
- dc-spell: a script surrounding the UNIX aspell tool; strips codeblocks before checking.
- dc-style: a script surrounding the UNIX style tool; strips codeblocks before checking.
- emojis.org: a collection of emojis routinely used with status output.
- install-deps.sh: an install script of sorts; loads the necessary tools and dependencies if they're not already loaded.
- plist.aws: a file required by aspell, though it does nto appear to actually matter.
- README.md: this file.
- sampledoc: a sample document for testing, cherry-picked for length and complexity from an active doc set.
- sampledoc.md: another sample document.
- testdoc: a contribed sample document that will pass all tests.

## Notes

1. aspell requires a personal list of acceptable spellings, otherwise it will return a lot of false positives.  
2. If the format of the plist.per is wrong (no header, see manpage), the spell check will fail silently except to mention that the personal dictionary is mis-formatted.
3. The personal dictionary must be in the $HOME of the user running dc-spell, with a properly formatted header for the main language dictionary to be used.
4. style output is checked only for (a) Flesch score (must be over 64) and passive voice (must be below 20%).  
5. In the event style fails on the Flesch score, a set of sentence statistics is printed.  These usually are sufficient to help the writer find issues with the doc.

## Installation

Assuming you are running Debian, the install-deps.sh will install all the necessary tools and files to your system, except for the personal dictionary.  You must add this yourself, in the user's $HOME, and name it "plist.per."

## Usage

To use these tools, you can run them individually, or use the dcheck bash script to run them consecutively.  The script uses "set -e" so a failure in any one of the component scripts will cause the entire script to exit.

dcheck runs these checks in increasing order of fix complexity, that is:

- dc-spell
- dc-linkchecker
- dc-proselint
- dc-style

The style command is rather unforgiving and, aside from sentence statistics, doesn't spoon-feed the user.  You will have to use it and get used to its quirks, but it's well worth the effort in terms of improved prose.

## Next steps

This is a first version, so there are probably many improvements and refinements to be made.  Feel free, but contribute them back to the repo, please.
