import os
import shutil
from os.path import join
import subprocess

SOURCE_DIR = "/media/vision/1d6890f4-df75-4531-a044-f6d3d44d033d/Downloads/MOT17/train"
DESTINATION_DIR = "/home/vision/danilowi/mot_zoo/yolo_finn/runs/detect/mot17dets"

for seqname in os.listdir(SOURCE_DIR):
    print(seqname)
    os.makedirs(join(DESTINATION_DIR, seqname, "det"), exist_ok=True)
    shutil.copy(join(SOURCE_DIR, seqname, "det/det.txt"), join(DESTINATION_DIR, seqname, "det/det.txt"))