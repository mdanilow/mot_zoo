# TRACKERS_TO_EVAL="quantyolov8_4w4a_mot15_cl0"
TRACKERS_TO_EVAL="sort_baseline"
TRACKERS_FOLDER=${PWD}/dcf_mot/output
# SINGLE_SEQUENCE="ETH-Sunnyday"
SINGLE_SEQUENCE="None"
cd TrackEval
python scripts/run_mot_challenge.py --SINGLE_SEQUENCE ${SINGLE_SEQUENCE} --SKIP_SPLIT_FOL True --METRICS CLEAR --BENCHMARK MOT15 --TRACKERS_FOLDER ${TRACKERS_FOLDER} --TRACKERS_TO_EVAL ${TRACKERS_TO_EVAL}