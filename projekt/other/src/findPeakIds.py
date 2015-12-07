#!/usr/local/bin/python3
# -*- coding: utf-8 -*-

import argparse
import os
import math
import random
import sys

parser = argparse.ArgumentParser()
parser.add_argument('-l',
                    type=str,
                    required=True,
                    help='Path to folder with .csv files from peax tool for labelled data.')
parser.add_argument('-u',
                    type=str,
                    required=True,
                    help='Path to folder with .csv files from peax tool for unlabelled data.')
parser.add_argument('-a',
                    type=str,
                    required=True,
                    help='Path for storing output of labelled data.')
parser.add_argument('-b',
                    type=str,
                    required=True,
                    help='Path for storing output of unlabelled data.')
parser.add_argument('-t',
                    type=float,
                    default=0.8,
                    help='Threshold for distance measure.')
args = parser.parse_args()

SET_BASELINE = True
peak_files_labelled = [os.path.join(args.l, fn) for fn in next(os.walk(args.l))[2]]
BASELINE = {}
OUTPUT_LABELLED = []
OUTPUT_UNLABELLED = []
MAX_ID = 0
SAMPLE_ID = 0


def rand_hex_color():
    r = lambda: random.randint(0, 255)
    return '#%02X%02X%02X' % (r(), r(), r())


def add_output(OUTPUT, file_name, peak_id, t, r, sid, col):
    OUTPUT.append('\n%s %s %s %s %s %s' % (file_name, peak_id, t, r, sid, col))


def euclidean_distance(t1, r1, t2, r2):
    return math.sqrt((
        (float(t1) - float(t2))**2 +
        (float(r1) - float(r2))**2)
    )

for peak_file in peak_files_labelled:
    SAMPLE_ID += 1
    if not peak_file.endswith('.csv'):
        continue
    with open(peak_file, mode='r') as f:
        if SET_BASELINE:
            # If baseline is not set, add the first file as baseline
            for line in f:
                line = line.split('\t')
                if line[1] == 'peak_name':
                    continue
                BASELINE[int(line[1][1:])] = {'t': line[2], 'r': line[3], 'col': rand_hex_color()}
                add_output(OUTPUT=OUTPUT_LABELLED, file_name=line[0], peak_id=line[1][1:], t=line[2], r=line[3], sid=SAMPLE_ID, col=BASELINE[int(line[1][1:])]['col'])
                MAX_ID = int(line[1][1:])
            SET_BASELINE = False
        else:
            # Baseline is set, so compare the input files with baseline
            for line in f:
                line = line.split('\t')
                if line[1] == 'peak_name':
                    continue
                CLOSEST_ID, DISTANCE = sys.maxsize, sys.maxsize

                # Check all current peak id's and find the closest id
                for p in BASELINE:
                    NEW_DISTANCE = euclidean_distance(t1=BASELINE[p]['t'], r1=BASELINE[p]['r'], t2=line[2], r2=line[3])
                    if DISTANCE > NEW_DISTANCE:
                        CLOSEST_ID = p
                        DISTANCE = NEW_DISTANCE

                # If distance is above threshold, then add peak with a newly created peak id
                if DISTANCE > args.t:
                    MAX_ID += 1
                    BASELINE[MAX_ID] = {'t': line[2], 'r': line[3], 'col': rand_hex_color()}
                    CLOSEST_ID = str(MAX_ID)
                add_output(OUTPUT=OUTPUT_LABELLED, file_name=line[0], peak_id=CLOSEST_ID, t=line[2], r=line[3], sid=SAMPLE_ID, col=BASELINE[int(CLOSEST_ID)]['col'])

peak_files_unlabelled = [os.path.join(args.u, fn) for fn in next(os.walk(args.u))[2]]
for peak_file in peak_files_unlabelled:
    SAMPLE_ID += 1
    if not peak_file.endswith('.csv'):
        continue
    with open(peak_file, mode='r') as f:
        for line in f:
            line = line.split('\t')
            if line[1] == 'peak_name':
                continue
            CLOSEST_ID, DISTANCE = sys.maxsize, sys.maxsize

            # Check all current peak id's and find the closest id
            for p in BASELINE:
                NEW_DISTANCE = euclidean_distance(t1=BASELINE[p]['t'], r1=BASELINE[p]['r'], t2=line[2], r2=line[3])
                if DISTANCE > NEW_DISTANCE:
                    CLOSEST_ID = p
                    DISTANCE = NEW_DISTANCE

            # If distance is above threshold, then add peak with a newly created peak id
            if DISTANCE > args.t:
                MAX_ID += 1
                BASELINE[MAX_ID] = {'t': line[2], 'r': line[3], 'col': rand_hex_color()}
                CLOSEST_ID = str(MAX_ID)
            add_output(OUTPUT=OUTPUT_UNLABELLED, file_name=line[0], peak_id=CLOSEST_ID, t=line[2], r=line[3], sid=SAMPLE_ID, col=BASELINE[int(CLOSEST_ID)]['col'])

with open(args.a, 'w') as f:
    f.write('%s %s %s %s %s %s' % ('file_name', 'peak_id', 't', 'r', 'sid', 'col'))
    f.write(''.join(OUTPUT_LABELLED))

with open(args.b, 'w') as f:
    f.write('%s %s %s %s %s %s' % ('file_name', 'peak_id', 't', 'r', 'sid', 'col'))
    f.write(''.join(OUTPUT_UNLABELLED))
