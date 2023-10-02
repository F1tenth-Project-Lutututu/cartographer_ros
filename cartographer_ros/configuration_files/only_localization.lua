-- Copyright 2016 The Cartographer Authors
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--      http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

include "map_builder.lua"
include "trajectory_builder.lua"

options = {
  map_builder = MAP_BUILDER,
  trajectory_builder = TRAJECTORY_BUILDER,
  map_frame = "map",
  tracking_frame = "imu_link",
  published_frame = "odom",
  odom_frame = "odom",
  provide_odom_frame = false,
  publish_frame_projected_to_2d = true,
  use_odometry = true,
  use_nav_sat = false,
  use_landmarks = false,
  num_laser_scans = 1,
  num_multi_echo_laser_scans = 0,
  num_subdivisions_per_laser_scan = 1,
  num_point_clouds = 0,
  lookup_transform_timeout_sec = 0.2,
  submap_publish_period_sec = 0.3,
  pose_publish_period_sec = 5e-3,
  trajectory_publish_period_sec = 30e-3,
  rangefinder_sampling_ratio = 1.,
  odometry_sampling_ratio = 1.,
  fixed_frame_pose_sampling_ratio = 1.,
  imu_sampling_ratio = 1.,
  landmarks_sampling_ratio = 1.,
}

MAP_BUILDER.use_trajectory_builder_2d = true

-- TRAJECTORY_BUILDER_2D.min_range = 0.12/
TRAJECTORY_BUILDER_2D.max_range = 9.0
TRAJECTORY_BUILDER_2D.min_range = 0.2
-- TRAJECTORY_BUILDER_2D.missing_data_ray_length = 3.
TRAJECTORY_BUILDER_2D.use_imu_data = true

--------------- ONLY FOR LOCALIZATION ---------------------



TRAJECTORY_BUILDER.pure_localization_trimmer = {
  max_submaps_to_keep = 3,
}

POSE_GRAPH.constraint_builder.sampling_ratio = 0.3
POSE_GRAPH.global_sampling_ratio = 0.003

-- TRAJECTORY_BUILDER_2D.ceres_scan_matcher.translation_weight = 1.
-- TRAJECTORY_BUILDER_2D.ceres_scan_matcher.rotation_weight = 10000.0

-- POSE_GRAPH.matcher_translation_weight = 1e5
-- POSE_GRAPH.matcher_rotation_weight = 1e3


-- POSE_GRAPH.optimize_every_n_nodes = 5
-- TRAJECTORY_BUILDER_2D.use_online_correlative_scan_matching = true 

-- POSE_GRAPH.constraint_builder.sampling_ratio = 0.05
-- POSE_GRAPH.constraint_builder.min_score = 0.25
-- POSE_GRAPH.global_constraint_search_after_n_seconds = 20
-- POSE_GRAPH.constraint_builder.ceres_scan_matcher.ceres_solver_options.max_num_iterations = 6
-- MAP_BUILDER.num_background_threads = 4
-- POSE_GRAPH.global_sampling_ratio = 0.003

------------------------------------------------------------


return options

