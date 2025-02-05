DETECTIONS="quantyolov8_4w4a_mot15_cl0"
cd sort
python sort.py --seq_path "../yolo_finn/runs/detect" --phase ${DETECTIONS}
