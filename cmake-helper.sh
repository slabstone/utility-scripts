#!/bin/bash

check_generator ()
{
  if [[ -z $1 ]]; then
    echo "error: missing generator"
    echo "args: <generator>"
    exit 1
  fi
}

check_build_type ()
{
  if [[ -z $1 ]]; then
    echo "error: missing build type"
    echo "args: <generator> <build-type>"
    exit 1
  fi
}

check_compiler_id ()
{
  if [[ -z $1 ]]; then
    echo "error: missing compiler"
    echo "args: <generator> <build-type> <compiler-executable>"
    exit 1
  fi
}

get_generator_name ()
{
  generator_id=$1
  case "$generator_id" in
    "2005")      generator_name="Visual Studio 8 2005" ;;
    "2017")      generator_name="Visual Studio 15 2017" ;;
    "2017-64")   generator_name="Visual Studio 15 2017 Win64" ;;
    "mingw")     generator_name="MinGW Makefiles"; cmake_additional_args+=("-DCMAKE_SH=CMAKE_SH-NOTFOUND"); ;;
    "nmake")     generator_name="NMake Makefiles" ;;
    "nmake-jom") generator_name="NMake Makefiles JOM" ;;
    "ninja")     generator_name="Ninja" ;;
    "auto")      generator_name="Not Specified" ;;
    *)           echo "error: unrecognized generator '$generator_id'"
                 echo "available generators:"
                 echo -e "2005\tVisual Studio 8 2005"
                 echo -e "2017\tVisual Studio 15 2017"
                 echo -e "2017-64\tVisual Studio 15 2017 Win64"
                 echo -e "mingw\tMinGW Makefiles"
                 echo -e "nmake\tNMake Makefiles"
                 echo -e "nmake-jom\tNMake Makefiles JOM"
                 echo -e "ninja\tNinja"
                 echo -e "auto\tUnspecified"
                 exit 2 ;;
  esac
}

get_build_type_name ()
{
  build_type_id=$1
  case "$build_type_id" in
    "d")    build_type_name="Debug" ;;
    "r")    build_type_name="Release" ;;
    "rd")   build_type_name="RelWithDebInfo" ;;
    "m")    build_type_name="MinSizeRel" ;;
    "dr")   build_type_name="Debug Release" ;;
    "a")    build_type_name="Debug Release RelWithDebInfo MinSizeRel" ;;
    "auto") build_type_name="Not Specified" ;;
    *)      echo "error: unrecognized build type '$build_type_id'"
            echo "available build types:"
            echo -e "d\tDebug"
            echo -e "r\tRelease"
            echo -e "rd\tRelWithDebInfo"
            echo -e "m\tMinSizeRel"
            echo -e "auto\tUnspecified"
            echo -e "\nbuild only:"
            echo -e "dr\tDebug + Release"
            echo -e "a\tDebug + Release + RelWithDebInfo + MinSizeRel"
            exit 2 ;;
  esac
}

get_build_dir ()
{
  if [[ $1 == "auto" ]]; then
    build_dir=build
  elif [[ $1 =~ ^[0-9]{4}$ ]] || [[ -z $2 ]]; then
    build_dir=build-$1
  else
    build_dir=build-$1-$2
  fi
}
