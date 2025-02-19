# DETECTIONS="quantyolov8_4w4a_mot15_cl0"
DETECTIONS="floatyolov8n_640_cl0"
cd sort
python sort.py --seq_path "../yolo_finn/runs/detect" --phase ${DETECTIONS} --use_conv_features 0 --debug_images /media/vision/1d6890f4-df75-4531-a044-f6d3d44d033d/Downloads/MOT15/train --debug
# python sort.py --seq_path "../yolo_finn/runs/detect" --phase ${DETECTIONS}
