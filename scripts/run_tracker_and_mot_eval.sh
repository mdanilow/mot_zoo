# DETECTIONS="quantyolov8_4w4a_mot15_cl0"
# DETECTIONS="floatyolov8n_640_cl0"
# DETECTIONS="sortdets"
# DETECTIONS="mot15dets"
# DETECTIONS="floatyolov8n_640_cl0_mot17"
DETECTIONS="mot17dets"
# BENCHMARK="MOT15"
BENCHMARK="MOT17"
# DEBUG_IMAGES="/media/vision/1d6890f4-df75-4531-a044-f6d3d44d033d/Downloads/MOT15/train"
DEBUG_IMAGES="/media/vision/1d6890f4-df75-4531-a044-f6d3d44d033d/Downloads/MOT17/train"
NAME="base_sort"
CONFIG="configs/base_sort.json"
# SINGLE_SEQUENCE="ETH-Sunnyday"
# SINGLE_SEQUENCE="PETS09-S2L1"
SINGLE_SEQUENCE="None"
cd dcf_mot
python sort.py --seq_path "../yolo_finn/runs/detect" --single_sequence ${SINGLE_SEQUENCE} --name ${NAME} --phase ${DETECTIONS} --config ${CONFIG} --debug_images ${DEBUG_IMAGES}

cd ../TrackEval
TRACKERS_FOLDER=../dcf_mot/output
python scripts/run_mot_challenge.py --SINGLE_SEQUENCE ${SINGLE_SEQUENCE} --SKIP_SPLIT_FOL False --METRICS CLEAR --BENCHMARK ${BENCHMARK} --TRACKERS_FOLDER ${TRACKERS_FOLDER} --TRACKERS_TO_EVAL "${DETECTIONS}_${NAME}"