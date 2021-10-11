# quickdiff

## Prerequisite

If you are using Ubuntu, run `sudo apt install texlive texlive-science perl latexdiff`


## Usage

### Quick start

Download the original and the revised source .zip files from Overleaf. Rename them to `origin.zip` and `revision.zip`.

Copy those .zip files into this quickdiff folder.

Run the scripts. HF!

`yijian.sh` is for generating the diff folder via two zip files (origin.zip, revision.zip).

`cleanup.sh` is to clean generated files.

### Details


`Makefile.template` is the template, to generate the Makefile. Modify it to compile your own tex!

`providecommand.tex` consists of commands that need to be inserted into the `main.tex`. Those commands are used by latexdiff.

#### Things done by `yijian.sh` 

Processing `origin.zip`;

Processing `revision.zip`;

Generating `diff`;

Processing `diff`;

Generating final pdf files.

#### Prepare your tex

##### Structure

`main.tex`

`tex/*.tex`

`figures/*.pdf`

`bibliography/final.bib`

`*.cls`

##### Don'ts

No `\looseness=-1` !!!

`\ignore{}` can be used, but not too many.
