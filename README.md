# stat547c-project-template
Project directory and LaTeX template for UBC STAT 547C Final Project reports

## Instructions for use:
1. Click the [Use this temnplate](https://github.com/ben-br/stat-547c-template/generate) button above.
1. Name your repository `yourinitials-stat547c`.
1. If necessary, [install git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) on your local machine.
1. [Clone](https://git-scm.com/docs/git-clone) your repository to your local machine.
1. At some point before you submit the report, [add me as a collaborator](https://help.github.com/en/articles/inviting-collaborators-to-a-personal-repository).<sup id="a1">[1](#f1)</sup>
1. Use the directory structure to keep your project organized and use the LaTeX template in the `doc/report` directory for your report. See below for more details on using the LaTeX template.
1. Commit and push your changes regularly. It serves as a back-up and lets me see how you progressed.
1. When you are ready to submit your report, commit with the message "final project submission".
1. Send me an email confirming that you have submitted your report for review and marking.


## Details on directory usage
The short version: Each subdirectory has its own README file that tells you what goes in the directory.

The long(er) version: 
* Use the `doc` directory to for all written portions of the project. Writing in `reading_log.md` and `project_log.md` are not required, but I have found that keeping them up-to-date is helpful for research. For the purposes of the final project, keeping these up-to-date also lets me see how you progressed through the project.
* Use `ref/STAT_547C.bib` to keep your biliography up-to-date, and use it as the bib-file for your report. Feel free to keep PDFs of relevant papers here; `.gitignore` won't upload them to GitHub.
* Use `src` for any code you develop and `dat` for any data you use (including output from your code). (There may be good reasons for not keeping your code in the same repository as your report, in which case let me know and invite me as a collaborator to that repo, as well.)
* Use `aux` for anything else.

## Details on LaTeX template usage
* Compile `main.tex`, but make minimal edits. Most edits should be made in the compontent tex-files in the `sections/` directory.
* `header.tex` loads packages, tweaks formatting, etc. Edit as necessary, but do not change document formatting.
* `defs.tex` defines notation, custom commands, etc. Edit freely.
* Graphics go in `fig`.
* `cleanup.sh` cleans up auxiliary files, etc., in case your directory looks cluttered. Usage is `./cleanup.sh clean-dir` where `clean-dir` is a path to the directory you want cleaned up.


<b id="f1">[1]</b> *When* you give me access is entirely up to you. I will not look at your repository before your submit your report unless you ask me to (and even then I may not). [↩](#a1)
