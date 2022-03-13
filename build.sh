JOBNAME=latex-talk
MAIN=latex-talk.tex

if [ "$1" == "-c" ]
then
    latexmk -c -f $JOBNAME
    latexmk -c -f $JOBNAME-handout
    rm -f *.xdv *.synctex.gz
else
    if [ "$1" == "-h" ]
    then
        JOBNAME=$JOBNAME-handout
        echo "\\def\\HANDOUT{}" >> $JOBNAME.make.tex
        echo "\\input{$MAIN}"   >> $JOBNAME.make.tex
    else
        echo "\\input{$MAIN}"   >  $JOBNAME.make.tex
    fi
    latexmk -jobname=$JOBNAME $JOBNAME.make.tex
    rm -f *.make.tex
fi

# Generate SVG
# mutool convert -F svg latex-talk.pdf 1
# mv out-0001.svg latex-talk.svg
# svgo -p 2 --multipass latex-talk.svg
