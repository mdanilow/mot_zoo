# DETECTIONS="quantyolov8_4w4a_mot15_cl0"
# DETECTIONS="floatyolov8n_640_cl0"
# DETECTIONS="sortdets"
# DETECTIONS="mot15dets"
# DETECTIONS="floatyolov8n_640_cl0_mot17"
DETECTIONS="mot17dets"
# DEBUG_IMAGES="/media/vision/1d6890f4-df75-4531-a044-f6d3d44d033d/Downloads/MOT15/train"
DEBUG_IMAGES="/media/vision/1d6890f4-df75-4531-a044-f6d3d44d033d/Downloads/MOT17/train"
NAME="test"
# CONFIG="configs/test.json"
CONFIG="configs/base_sort.json"
# SINGLE_SEQUENCE="ETH-Sunnyday"
# SINGLE_SEQUENCE="PETS09-S2L1"
SINGLE_SEQUENCE="None"

cd dcf_mot
python sort.py --debug --seq_path "../yolo_finn/runs/detect" --single_sequence ${SINGLE_SEQUENCE} --name ${NAME} --phase ${DETECTIONS} --config ${CONFIG} --debug_images ${DEBUG_IMAGES}
