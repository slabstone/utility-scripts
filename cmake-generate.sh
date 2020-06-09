#!/bin/bash

source cmake-helper.sh

if [[ ! -d "src" ]]; then
  echo "error: source directory not found"
  exit 3
fi

generator_id=$1
check_generator $generator_id
get_generator_name $generator_id
echo "Generator: $generator_name"

cmake_args=("../src")
if [[ $generator_id != "auto" ]]; then
  cmake_args+=("-G" "$generator_name")
fi

if [[ $generator_name =~ "Makefiles" ]] || [[ $generator_name == "Ninja" ]]; then
  build_type_id=$2
  check_build_type $build_type_id
  get_build_type_name $build_type_id
  echo "Build Type: $build_type_name"

  if [[ $build_type_id != "auto" ]]; then
    cmake_additional_args+=("-DCMAKE_BUILD_TYPE=$build_type_name")
  fi
fi

if [[ $generator_name == "Ninja" ]]; then
  compiler_id=$3
  check_compiler_id $compiler_id
  cmake_additional_args+=("-DCMAKE_CXX_COMPILER=$compiler_id")
fi

get_build_dir $generator_id $build_type_id
echo "Build Directory: $build_dir"

if [[ ! -d "$build_dir" ]]; then
  mkdir "$build_dir" || { echo "error: failed to create directory $build_dir"; exit 3; }
fi

cd "$build_dir" &&
cmake "${cmake_args[@]}" "${cmake_additional_args[@]}" &&
cd ..
