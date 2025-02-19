# DETECTIONS="quantyolov8_4w4a_mot15_cl0"
DETECTIONS="floatyolov8n_640_cl0"
cd sort
# python sort.py --seq_path "../yolo_finn/runs/detect" --phase ${DETECTIONS}
python sort.py --seq_path "../yolo_finn/runs/detect" --phase ${DETECTIONS} --use_conv_features 4 --debug_images /media/vision/1d6890f4-df75-4531-a044-f6d3d44d033d/Downloads/MOT15/train

cd ../TrackEval
TRACKERS_FOLDER=../sort/output
python scripts/run_mot_challenge.py --SKIP_SPLIT_FOL True --METRICS CLEAR --BENCHMARK MOT15 --TRACKERS_FOLDER ${TRACKERS_FOLDER} --TRACKERS_TO_EVAL ${DETECTIONS}