# DETECTIONS="quantyolov8_4w4a_mot15_cl0"
# DETECTIONS="floatyolov8n_640_cl0"
DETECTIONS="mot15dets"
NAME="test"
CONFIG="configs/test.json"
SINGLE_SEQUENCE="ETH-Sunnyday"
cd dcf_mot
python sort.py --debug --seq_path "../yolo_finn/runs/detect" --single_sequence ${SINGLE_SEQUENCE} --name ${NAME} --phase ${DETECTIONS} --config ${CONFIG} --debug_images /media/vision/1d6890f4-df75-4531-a044-f6d3d44d033d/Downloads/MOT15/train
