#!/bin/bash

cd $( dirname "${BASH_SOURCE[0]}" )

FILES=`find ../data/labelled_candy_raw/*.csv`
WORKDIR=`pwd`
PLOTDIR=../plots/density/

if [ ! -d ${PLOTDIR} ]
then
    echo "Creating directory ${PLOTDIR}"
    mkdir -p ${PLOTDIR}
fi

for FILE in $FILES
do
    Rscript densityPlot.R ${WORKDIR} ${FILE} ${PLOTDIR}$(basename $FILE .csv).png
done
