# Manual for DM847 Exam Project

<!-- MarkdownTOC -->

- [Status of Implementation](#status-of-implementation)
- [Requirements](#requirements)
- [The Contents of the Folder](#the-contents-of-the-folder)
- [How to Compile](#how-to-compile)
- [Results](#results)
    - [Example Density Plots](#example-density-plots)
    - [Peak Alignment](#peak-alignment)
    - [Results from 5-fold Cross Validation](#results-from-5-fold-cross-validation)
    - [Results from Random Forest Prediction](#results-from-random-forest-prediction)
    - [Results from Attribute Selection](#results-from-attribute-selection)
    - [Results from Decision Tree Trained on Reduced Data Set](#results-from-decision-tree-trained-on-reduced-data-set)

<!-- /MarkdownTOC -->

## Status of Implementation

__Legend:__

  - [✓]: Done, 
  - [~] Not possible in WEKA, workaround used
  - [-] Still needs a bit work)

__Work status:__

  1. [✓] Reads several raw data files
  2. [✓] Generate density plots
  3. [✓] Call PEAX to generate peaks
  4. [✓] Implement peak alignment
  5. [✓] Read the class file and assign labels
  6. [✓] Create a matrix for training
  7. [✓] Create a peak alignment matrix
  8. [✓] Train a random forest classifier
  9. [✓] Implement 5-fold cross validation
  10. [✓] Report the mean accuracy, sensitivity, and specificity
  11. [~] Extract the five most discriminating features (peaks) ~~by using the
  Gini index~~. 
      - __This is not possible to do in weka, instead we do this the weka way.
        Jan has already told us that we can choose these in any way, since he
        doesn't know how to do this in weka, only in R.__
  12. [-] Learn and plot/report a decision tree by using only these five best
      features/peaks
      - __TODO We get some rather weird results from this. See
        FeatureSelector.java, we currently get a nice sub-set of attributes,
        which all seem to be working just fine. However we do have problems
        with producing a nice tree (J48), as it always seem to split on only a
        single feature (p37).__
  13. [✓] Use code from part one to process and align training and test data
  14. [-] Apply classifier learned in part 1. 
      - __TODO Should we run this using the reduced test data set from (12)?__
  15. [-] Hand in the predicted test set.
      - __TODO Right now we only produce a CSV file, we should produce a test
        file, see the example file on the website. This should be
        straightforward.__

## Requirements

The following are the requirements, to be able to compile and run this
project:

  - Java 8 (JRE and JDK)
  - Maven

Additionally Maven pulls in the following dependencies:

  - weka-stable, v3.6.13

## The Contents of the Folder

The following is the directory structure of our hand-in. Comments for each
file are in square brackets, i.e. `[Comment goes here]`.

```text
├── candy_labels [Contains data files for labelled input]
│   ├── BD18_1511121654_ims.csv [Raw input file]
│   ├── labels.csv [Contains the labels for the file]
│   ├── output [Output of the processing stage]
│   │   ├── BD18_1511121654_ims_density_plot.png [Density plot]
│   │   └── final_BD18_1511121654_ims.csv [Output from PEAX]
├── candy_no_labels [Contains input files with no label]
│   ├── BD18_1511110743_ims.csv [Raw input file]
│   └── output [Output of the processing stage]
│       ├── BD18_1511110743_ims_density_plot.png
│       └── final_BD18_1511110743_ims.csv
├── candy_raw [Input files from part 1]
│   ├── BD18_1408280826_ims.csv
│   ├── files categories.txt
│   └── output
│       └── final_BD18_1408280826_ims.csv
├── peax [Contains the PEAX binaries and config]
├──src/main/java/dk/sdu/dm847/exam/ [Source folder + Package structure]
│   ├── CsvParser.java [Utility class for parsing CSV files]
│   ├── RunMe.java [The main class for running all the parts]
│   ├── task1
│   │   ├── Label.java [Models a label]
│   │   ├── Peak.java [Models a peak]
│   │   ├── PeakAlignment.java [Runs the peak alignment]
│   │   └── PreprocessData.java [Runs PEAX and creates density plots]
│   ├── task2
│   │   ├── FeatureSelection.java [Runs feature selection, and trains a model]
│   │   ├── Predict.java [Predicts based on a given model on some test data]
│   │   └── Train.java [Trains a model based on previous output]
│   └── ToolUtils.java [Utility for running PEAX and R]
├── all_peaks.png [Contains peaks before alignment]
├── plot.png [Contains peaks after alignment]
├── R-plot.r [Utility file for creating density plots]
├── peakAlignedLabelled.arff [Processed training data]
├── peakAlignedUnlabelled.arff [Processed test data]
├── halls_rf_trained.model [Model ready to be used]
├── halls_prediction.csv [Prediction based on model]
├── pom.xml [Build file for Maven]
├── README.md [This file]
```

## How to Compile

The project should be importable through IntelliJ IDEA 15, or it should be
possible to compile from the command-line using Maven with:

```
cd ROOT_DIRECTORY_OF_PROJECT
mvn compile
```

And it may be run using:

```
cd ROOT_DIRECTORY_OF_PROJECT
mvn exec:java -Dexec.mainClass="dk.sdu.dm847.exam.RunMe" -Dexec.classpathScope=runtime
```

## Results

### Example Density Plots

The following shows two examples of the density plots generated.

The following shows a density plot for an original halls:

![Density plot for halls](candy_labels/output/BD18_1511121654_ims_density_plot.png)

This shows for a citrus halls:

![Density plot for citrus](candy_labels/output/BD18_1511121658_ims_density_plot.png)

### Peak Alignment

Results from PEAX (Before alignment):

![All peaks from PEAX](all_peaks.png)

After peak-alignment, notice how a lot of peaks that are nearby are clusted
into a single one:

![Peaks after alignment](plot.png)

### Results from 5-fold Cross Validation

__TODO__

### Results from Random Forest Prediction

__TODO__

### Results from Attribute Selection

__TODO__

### Results from Decision Tree Trained on Reduced Data Set

__TODO__
