import os
import shutil
from os.path import join
import subprocess

SEQUENCES_DIR = "/home/vision/danilowi/mot_zoo/yolo_finn/runs/detect/floatyolov8n_640_cl0"
SOURCE_DIR = "/home/vision/danilowi/mot_zoo/yolo_finn/runs/detect/floatyolov8n_640_cl0/{}/features"
DESTINATION_DIR = "/home/vision/danilowi/mot_zoo/yolo_finn/runs/detect/mot15dets/{}/features"

for seqname in os.listdir(SEQUENCES_DIR):
    print(seqname)
    print(subprocess.run(["ln", "-s", SOURCE_DIR.format(seqname), DESTINATION_DIR.format(seqname)], capture_output=True))