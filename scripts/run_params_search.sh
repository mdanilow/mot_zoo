# SPLIT_TO_EVAL="train"
SPLIT_TO_EVAL="val_half"

# DETECTIONS="quantyolov8_4w4a_mot15_cl0"
# DETECTIONS="floatyolov8n_640_cl0"
# DETECTIONS="sortdets"
# DETECTIONS="floatyolov8n_640_cl0_mot17"
# DETECTIONS="mot15dets"
# DETECTIONS="mot17dets"
DETECTIONS="yolox_mot17_val_half"

# BENCHMARK="MOT15"
BENCHMARK="MOT17"

# DEBUG_IMAGES="/media/vision/1d6890f4-df75-4531-a044-f6d3d44d033d/Downloads/MOT15/train"
DEBUG_IMAGES="/media/vision/1d6890f4-df75-4531-a044-f6d3d44d033d/Downloads/MOT17/train"

# NAME="params_search_bytetracker2_dcf"
NAME="params_search_bytetracker2_dcf-crisp8"

CONFIG="configs/bytetracker2_dcf.json"

PARAMS_SEARCH_CONFIG="configs/params_search/params_search_dcf.json"

# SINGLE_SEQUENCE="ETH-Sunnyday"
# SINGLE_SEQUENCE="PETS09-S2L1"
SINGLE_SEQUENCE="None"

# METRICS="CLEAR"
METRICS="HOTA"



if [[ "${BENCHMARK}" == "MOT15" ]]; then
    DET_SCORE_DIVISION=100
else
    DET_SCORE_DIVISION=1
fi

cd dcf_mot
python sort.py --params_search ${PARAMS_SEARCH_CONFIG} --detections_dir "../yolo_finn/runs/detect" --single_sequence ${SINGLE_SEQUENCE} --name ${NAME} --detections ${DETECTIONS} --config ${CONFIG} --debug_images ${DEBUG_IMAGES} --det_score_division ${DET_SCORE_DIVISION}

cd ../TrackEval
TRACKERS_FOLDER=../dcf_mot/output/${NAME}
python scripts/run_mot_challenge.py --SPLIT_TO_EVAL ${SPLIT_TO_EVAL} --SINGLE_SEQUENCE ${SINGLE_SEQUENCE} --SKIP_SPLIT_FOL False --METRICS ${METRICS} --BENCHMARK ${BENCHMARK} --TRACKERS_FOLDER ${TRACKERS_FOLDER}