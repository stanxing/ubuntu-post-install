#!/bin/bash -e

# 遍历执行 functions 下的脚本
main() {
    path=$(cd $(dirname "$0"); pwd)
    functionsPath=${path}/functions
    echo $path
    if [[ -d ${functionsPath} ]]; then
        for function in ${functionsPath}/*; do
            echo "----------------------------------- Executing $function"
            ${function}
            echo "----------------------------------- Executed $function"
        done 
    else
        echo "functions dirctory does not exist."
        exit 1
    fi
}

main