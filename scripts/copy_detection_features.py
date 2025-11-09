import os
import shutil
from os.path import join
import subprocess

MOT17 = True
SEQUENCES_DIR = "/home/vision/danilowi/mot_zoo/yolo_finn/runs/detect/mot17dets"
SOURCE_DIR = "/home/vision/danilowi/mot_zoo/yolo_finn/runs/detect/floatyolov8n_640_cl0_mot17/{}/features"
DESTINATION_DIR = "/home/vision/danilowi/mot_zoo/yolo_finn/runs/detect/mot17dets/{}/features"

for seqname in os.listdir(SEQUENCES_DIR):
    # print("\tdupa")
    print(seqname)
    if MOT17:
        source_seqname = "-".join([seqname.split("-")[0], seqname.split("-")[1], "FRCNN"])
    else:
        source_seqname = seqname
    # print(source_seqname)
    print(subprocess.run(["ln", "-s", SOURCE_DIR.format(source_seqname), DESTINATION_DIR.format(seqname)], capture_output=True))