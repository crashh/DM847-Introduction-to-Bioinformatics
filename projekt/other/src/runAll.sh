#!/bin/bash

cd $( dirname "${BASH_SOURCE[0]}" )
WORKDIR=`pwd`

#######################################
# Make density plots
#######################################
function densityplots {
    LABFILES=`find ../data/labelled_candy_raw/*.csv`
    UNLABFILES=`find ../data/unlabelled_candy_raw/*.csv`
    LABPLOTDIR=../plots/density/labelled/
    UNLABPLOTDIR=../plots/density/unlabelled/

    if [ ! -d ${LABPLOTDIR} ]
    then
        echo "Creating directory ${LABPLOTDIR}"
        mkdir -p ${LABPLOTDIR}
    fi

    if [ ! -d ${UNLABPLOTDIR} ]
    then
        echo "Creating directory ${UNLABPLOTDIR}"
        mkdir -p ${UNLABPLOTDIR}
    fi

    for FILE in $LABFILES
    do
        Rscript densityplot.R ${WORKDIR} ${FILE} ${LABPLOTDIR}$(basename $FILE .csv).png
    done

    for FILE in $UNLABFILES
    do
        Rscript densityplot.R ${WORKDIR} ${FILE} ${UNLABPLOTDIR}$(basename $FILE .csv).png
    done
}

while true; do
    read -p "Do you wish to create the density plots for all the data?" yn
    case $yn in
        [Yy]* ) densityplots; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done


#######################################
# Use peaks tool
#######################################
RAW_LABELLED=`find ../data/labelled_candy_raw/*.csv`
RAW_UNLABELLED=`find ../data/unlabelled_candy_raw/*.csv`
PEAKDIR_LABELLED=../data/peaks_labelled
PEAKDIR_UNLABELLED=../data/peaks_unlabelled

if [ ! -d ${PEAKDIR_LABELLED} ] ; then
    echo "Creating directory ${PEAKDIR_LABELLED}"
    mkdir -p ${PEAKDIR_LABELLED}
fi
if [ ! -d ${PEAKDIR_UNLABELLED} ] ; then
    echo "Creating directory ${PEAKDIR_UNLABELLED}"
    mkdir -p ${PEAKDIR_UNLABELLED}
fi
for FILE in $RAW_LABELLED ; do
    echo "Running peax tool for ${FILE}"
    #../bin/peax ${FILE} ${PEAKDIR_LABELLED}/$(basename $FILE .csv)-peak.csv > /dev/null
done
for FILE in $RAW_UNLABELLED ; do
    echo "Running peax tool for ${FILE}"
    #../bin/peax ${FILE} ${PEAKDIR_UNLABELLED}/$(basename $FILE .csv)-peak.csv > /dev/null
done

#######################################
# Find peak IDs and store in .csv files
#######################################
echo "Finding peak ID's for both labelled and unlabelled data"
THRESHOLD=0.5
OUT_LABELLED=../data/peakoutput_labelled.csv
OUT_UNLABELLED=../data/peakoutput_unlabelled.csv
PLOTDIR=../plots/peak/

if [ ! -d ${PLOTDIR} ] ; then
    echo "Creating directory ${PLOTDIR}"
    mkdir -p ${PLOTDIR}
fi

python3 findPeakIds.py -l ${PEAKDIR_LABELLED} -u ${PEAKDIR_UNLABELLED} -t ${THRESHOLD} -a ${OUT_LABELLED} -b ${OUT_UNLABELLED}
Rscript peakalign.R ${WORKDIR} ${OUT_LABELLED} ${PLOTDIR}$(basename $OUT_LABELLED .csv).png ${PLOTDIR}$(basename $OUT_LABELLED .csv)_histogram.png > /dev/null

#######################################
# Create indicator matrices
#######################################
echo "Creating indicator matrices"
LABEL_FILE=../data/labelled_candy_raw/class_labels.txt
OUTPUT_MATRIX_LABELLED=../data/indicator_matrix_labelled.csv
OUTPUT_MATRIX_UNLABELLED=../data/indicator_matrix_unlabelled.csv

python3 createIndicatorMatrix.py -p ${OUT_LABELLED} -l ${LABEL_FILE} > ${OUTPUT_MATRIX_LABELLED}
python3 createIndicatorMatrix.py -p ${OUT_UNLABELLED} > ${OUTPUT_MATRIX_UNLABELLED}

#######################################
# Running random forest classifier
#######################################
echo "Running random forest classifier"
K=5
PREDICTION_OUTPUT=predicted_classes_unlabelled_data.csv
Rscript random_forest_fold.R ${K} ../data/ $(basename $OUTPUT_MATRIX_LABELLED) $(basename $OUTPUT_MATRIX_UNLABELLED) ${PREDICTION_OUTPUT} 2> /dev/null
