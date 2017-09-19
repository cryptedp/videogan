import numpy as np
import json
import os
import ffmpeg
import argparse
import subprocess
import random
from scipy.ndimage.filters import gaussian_filter

direct = '/media/sammer/Seagate Backup Plus Drive/activitNet'

def extract_frames(key,info):
    frames = list(zip(info['SegmentStart'],info['SegmentEnd']))
    name = key+".mp4"
    abs_file_path = os.path.join(direct, name)
    if os.path.exists(abs_file_path):

        for i in frames:
            start= str(i[0])
            end= str(i[1])



def trim_video(key,filename,startFrame,endFrame):
    out_file = key+"out"+".mp4"
    in_file = ffmpeg.input(filename)
    in_file = ffmpeg.trim(in_file,start=startFrame,end=endFrame)
    in_file = ffmpeg.output(os.path.join(direct, out_file))
    ffmpeg._run(in_file)




with open('../data/videos_segments.json') as data_file:
    data = json.load(data_file)

for key,value in data.items():
    extract_frames(key,data[key])



