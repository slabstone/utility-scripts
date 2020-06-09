#!/bin/bash

source cmake-helper.sh

generator_id=$1
check_generator $generator_id

build_type_id=$2
check_build_type $build_type_id

get_build_dir $generator_id $build_type_id
echo "Build Directory: $build_dir"

if [[ ! -d "$build_dir" ]]; then
  echo "error: build directory not found"
  exit 3
fi

cmake_args=("--build" "$build_dir")

get_build_type_name $build_type_id
echo "Build Type(s): $build_type_name"

if [[ $generator_id =~ "2017" ]]; then
  vs_verbosity_level=m
  vs_additional_args+=("--" "-nologo" "-v:$vs_verbosity_level")
fi

if [[ $build_type_id == "auto" ]]; then
  cmake "${cmake_args[@]}"
else
  for current_build_type in $build_type_name; do
    echo "Current Build Type: $current_build_type"
    cmake_additional_args=("--config" "$current_build_type")
    cmake "${cmake_args[@]}" "${cmake_additional_args[@]}" "${vs_additional_args[@]}" ||
    { echo "error: $current_build_type build failed"; exit 3; }
  done
fi
