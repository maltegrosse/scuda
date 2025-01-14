#!/bin/bash

echo "Connecting to SCUDA server at: $SCUDA_SERVER"
echo "Using scuda binary at path: $libscuda_path"

if [[ "$1" == "torch" ]]; then
    echo "Running torch example..."
    LD_PRELOAD="$libscuda_path" python3 -c "import torch; print('CUDA Available:', torch.cuda.is_available())"
elif [[ "$1" == "cublas" ]]; then
    echo "Running cublas example..."

    LD_PRELOAD="$libscuda_path" /matrixMulCUBLAS
else
    echo "Unknown option: $1. Please specify 'torch' or 'cublas'."
fi