DETECTIONS="quantyolov8_4w4a_mot15_cl0"
# DETECTIONS="floatyolov8n_640_cl0"
cd sort
python sort.py --seq_path "../yolo_finn/runs/detect" --phase ${DETECTIONS}

cd ../TrackEval
TRACKERS_FOLDER=../sort/output
python scripts/run_mot_challenge.py --SKIP_SPLIT_FOL True --METRICS CLEAR --BENCHMARK MOT15 --TRACKERS_FOLDER ${TRACKERS_FOLDER} --TRACKERS_TO_EVAL ${DETECTIONS}