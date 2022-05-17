#!/usr/bin/env bash

DIR_ATIV6="${PWD}"

for i in 1 1 1 2 2 2 4 4 4; do
    echo "Number of Processes: $i"
    echo ""

    DATE_EXT="$(date +%Y%m%d-%H%M%S)"
    mkdir output_nproc_${i}_at_${DATE_EXT} 

    docker run --env OMP_NUM_THREADS=1 --rm --network=host \
        -v=$(pwd):/root dist_dcgan:mo833 python -m torch.distributed.launch \
        --nproc_per_node=$i --nnodes=1 --node_rank=0 --master_addr="172.17.0.1" \
        --master_port=1234 dist_dcgan.py --dataset cifar10 --dataroot ./cifar10 \
        --num_epochs 1 --batch_size 16 --out_folder "${DIR_ATIV6}/output_nproc_${i}_at_${DATE_EXT}" \
        > output_nproc_${i}_at_${DATE_EXT}/output.txt
    
    echo "--------------"
done

#sudo shutdown now
