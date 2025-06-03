# DETECTIONS="quantyolov8_4w4a_mot15_cl0"
# DETECTIONS="floatyolov8n_640_cl0"
DETECTIONS="sortdets"
NAME="base_sort"
CONFIG="configs/base_sort.json"
# SINGLE_SEQUENCE="ETH-Sunnyday"
SINGLE_SEQUENCE="None"
cd dcf_mot
python sort.py --seq_path "../yolo_finn/runs/detect" --single_sequence ${SINGLE_SEQUENCE} --name ${NAME} --phase ${DETECTIONS} --config ${CONFIG} --debug_images /media/vision/1d6890f4-df75-4531-a044-f6d3d44d033d/Downloads/MOT15/train

cd ../TrackEval
TRACKERS_FOLDER=../dcf_mot/output
python scripts/run_mot_challenge.py --SINGLE_SEQUENCE ${SINGLE_SEQUENCE} --SKIP_SPLIT_FOL True --METRICS CLEAR --BENCHMARK MOT15 --TRACKERS_FOLDER ${TRACKERS_FOLDER} --TRACKERS_TO_EVAL "${DETECTIONS}_${NAME}"