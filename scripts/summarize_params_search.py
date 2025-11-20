import argparse
import os
from os.path import join

import numpy as np
import json
import matplotlib
import matplotlib.pyplot as plt
# matplotlib.use('TkAgg')


def plot_motas_idsws(X, Y, motas, idsws):
    x_grid = list(set(X))
    x_grid.sort()
    y_grid = list(set(Y))
    y_grid.sort()
    mota_points = [(x, y, mota) for x, y, mota in zip(X, Y, motas)]
    x_mesh, y_mesh = np.meshgrid(x_grid, y_grid)
    x_to_i = {x: i for i, x in enumerate(x_grid)}
    y_to_j = {y: j for j, y in enumerate(y_grid)}
    mota_data = np.zeros(x_mesh.shape)
    for x, y, mota in mota_points:
        # print(x, y, mota)
        mota_data[y_to_j[y], x_to_i[x]] = mota
    # print(mota_data)
    # print(search_space[0][1], X)
    # print(search_space[1][1], Y)
    fig, ax = plt.subplots(subplot_kw={"projection": "3d"})
    ax.plot_surface(x_mesh, y_mesh, mota_data)
    ax.set_xlabel(search_space[0][1])
    ax.set_ylabel(search_space[0][1])
    ax.set_zlabel("MOTA")
    plt.show()


def parse_args():
    """Parse input arguments."""
    parser = argparse.ArgumentParser()
    parser.add_argument("--src", help="Path to params search results", type=str)
    args = parser.parse_args()
    return args


args = parse_args()
experiment_dirs = [dir for dir in os.listdir(args.src) if os.path.isdir(join(args.src, dir))]
motas = []
idsws = []
summary = {}

# get search space
args_json = join(args.src, experiment_dirs[0], "args.json")
with open(args_json, "r") as file:
    params_search_args = json.load(file)
params_search_json = join("dcf_mot", params_search_args["args"]["params_search"])
print(params_search_json)
search_space = []
grids = []
with open(params_search_json, "r") as file:
    params_search_dict = json.load(file)
    for sub_config in params_search_dict.keys():
        for k in params_search_dict[sub_config].keys():
            search_space.append((sub_config, k))
            grids.append(eval(params_search_dict[sub_config][k]))

# collect results
X = []
Y = []
for dir in experiment_dirs:
    exp_dir = join(args.src, dir)
    exp_args = join(exp_dir, "args.json")
    with open(exp_args, "r") as args_file:
        exp_args = json.load(args_file)
    mot_results = join(exp_dir, "pedestrian_summary.txt")
    if os.path.exists(mot_results):
        with open(mot_results, "r") as results_file:
            lines = results_file.readlines()
            exp_results_dict = {}
            keys = lines[0].strip().split(" ")
            values = lines[1].strip().split(" ")
            for k, v in zip(keys, values):
                exp_results_dict[k] = float(v)
    # print(dir, exp_results_dict["MOTA"], exp_results_dict["IDSW"])
    motas.append(exp_results_dict["MOTA"])
    idsws.append(exp_results_dict["IDSW"])
    x_param = exp_args[search_space[0][0]][search_space[0][1]]
    y_param = exp_args[search_space[1][0]][search_space[1][1]]
    X.append(x_param)
    Y.append(y_param)
    summary[dir] = [exp_results_dict["MOTA"], exp_results_dict["IDSW"], {search_space[0][1]: x_param, search_space[1][1]: y_param}]



motas = np.array(motas)
idsws = np.array(idsws)
# for el in idsws:
#     print(el)
print(max(motas))
print(min(idsws))
best_motas = np.where(motas == max(motas))[0]
best_idsws = np.where(idsws == min(idsws))[0]
best_motas = [experiment_dirs[x] for x in best_motas]
best_idsws = [experiment_dirs[x] for x in best_idsws]

print("MOTAS")
for el in best_motas:
    print(el, summary[el])
print("IDSW")
for el in best_idsws:
    print(el, summary[el])

# plot
plot_motas_idsws(X, Y, motas, idsws)


# best = list(set(best_motas) & set(best_idsws))
# best = [experiment_dirs[x] for x in best]
# for exp in best:
#     args_json = join(args.src, exp, "args.json")
#     with open(args_json, "r") as f:
#         exp_args = json.load(f)
#     print(exp, exp_args["tracker_config"]["not_matched_for_lost_th"], exp_args["tracker_config"]["lost_sr_th"])
