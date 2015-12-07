#!/usr/local/bin/python3
# -*- coding: utf-8 -*-

import argparse

parser = argparse.ArgumentParser()
parser.add_argument('-p',
                    type=str,
                    required=True,
                    help='Path to .csv file with peaks for samples.')
parser.add_argument('-l',
                    type=str,
                    required=False,
                    help='Path the csv file that contains labels for samples.')
args = parser.parse_args()

SAMPLE_IDS = {}
SAMPLE_ID = -1
PEAK_IDS = {}
NUM_PEAKS = -1

with open(args.p, mode='r') as f:
    for line in f:
        line = line.split()
        if line[0] == 'file_name':
            continue
        if line[0] not in SAMPLE_IDS:
            SAMPLE_ID += 1
            SAMPLE_IDS[line[0]] = SAMPLE_ID
        if line[1] not in PEAK_IDS:
            NUM_PEAKS += 1
            PEAK_IDS[line[1]] = NUM_PEAKS

MATRIX = [0 for _ in range(SAMPLE_ID+2)]
for i in range(SAMPLE_ID+2):
    MATRIX[i] = ['0' for _ in range(NUM_PEAKS+3)]

with open(args.p, mode='r') as f:
    for line in f:
        line = line.split()
        if line[0] == 'file_name':
            continue
        MATRIX[SAMPLE_IDS[line[0]]+1][PEAK_IDS[line[1]]+1] = '1'

MATRIX[0][0] = 'sample\peak'
for sample in SAMPLE_IDS:
    MATRIX[SAMPLE_IDS[sample]+1][0] = sample

for peak in PEAK_IDS:
    MATRIX[0][PEAK_IDS[peak]+1] = peak

# Add labels
if args.l is not None:
    MATRIX[0][NUM_PEAKS+2] = 'class'
    with open(args.l) as f:
        for line in f:
            line = line.split()
            if line[0] == 'file':
                continue
            MATRIX[SAMPLE_IDS[line[0]]+1][NUM_PEAKS+2] = line[1]

# Print the resulting indicator matrix
for m in range(len(MATRIX)):
    if args.l is not None:
        print('\t'.join(MATRIX[m]))
    else:
        print('\t'.join(MATRIX[m][:-1]))
