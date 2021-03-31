#!/bin/bash

# Put this script in the dir where the origin and the revision dirs locate, please!
# In the origin dir, only one zip file (before camera-ready) should be in there.
# In the revision dir, only one zip file (camera-ready) should be in there.

# NOTE: Assume that only the tex dir in the overleaf project has been modified during the camera-ready preparation.

export YIJIAN_DIR=$PWD

# compiling origin
mkdir origin
cp origin.zip origin
cp Makefile.template origin/Makefile
cd origin
unzip *.zip
rm -f *.zip
# Assume the output file is the main.pdf, which can be configured in the Makefile.template
rm -f main.pdf
make


# compiling revision
cd $YIJIAN_DIR
mkdir revision
cp revision.zip revision
cp Makefile.template revision/Makefile
cd revision
unzip *.zip
rm -f *.zip
rm -f main.pdf
make


# generating diff
cd $YIJIAN_DIR
mkdir diff
cp revision.zip diff
cp Makefile.template diff/Makefile
cd diff
unzip *.zip
rm -f *.zip
rm -f main.pdf
# Assume we use tex dir to hold all meaningful text (such as intro.tex)
cd tex
# traverse all tex files in tex/
for file in ./*.tex
do
	cp $YIJIAN_DIR/origin/tex/$file ./${file}_draft
	mv $file ./${file}_revision
	latexdiff ${file}_draft ${file}_revision > $file
done
#cp $YIJIAN_DIR/origin/tex/introduction.tex ./introduction_draft.tex
#mv introduction.tex introduction_revision.tex
#latexdiff introduction_draft.tex introduction_revision.tex > introduction.tex

# compiling diff
cd $YIJIAN_DIR
cp providecommand.tex diff
cd diff
# Assume the 3rd line is empty
sed -i '3 r providecommand.tex' main.tex
make

# copying
cd $YIJIAN_DIR
cp $YIJIAN_DIR/revision/main.pdf ./revision.pdf
cp $YIJIAN_DIR/diff/main.pdf ./diff.pdf

