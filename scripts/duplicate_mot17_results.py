import os
import shutil
from os.path import join
import subprocess

SOURCE_DIR = "/home/vision/danilowi/mot_zoo/dcf_mot/output/fasttracker_mot17_pub/data"

for seqname in os.listdir(SOURCE_DIR):
    print(seqname)
    shutil.copy(join(SOURCE_DIR, seqname), join(SOURCE_DIR, seqname.replace("FRCNN", "DPM")))
    shutil.copy(join(SOURCE_DIR, seqname), join(SOURCE_DIR, seqname.replace("FRCNN", "SDP")))