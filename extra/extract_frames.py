import numpy as np
import json
import os
import argparse
import subprocess
import random
from scipy.ndimage.filters import gaussian_filter


from pprint import pprint

with open('../data/videos_segments.json') as data_file:
    data = json.load(data_file)

def get_segments(datapoints):
    segments = []
    for key, value in datapoints.items():
        segment_start = datapoints[key]['SegmentStart']
        segment_end = datapoints[key]['SegmentEnd']
        segments.append(tuple((segment_start,segment_end)))

    return segments

print(get_segments(data))