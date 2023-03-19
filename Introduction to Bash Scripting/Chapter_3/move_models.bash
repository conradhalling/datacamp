#!/usr/bin/env bash

# USAGE
#   bash move_models.bash
# DESCRIPTION
#   Use a CASE statement to move the tree-based models (Random Forest, GBM,
#   and XGBoost) to the tree_models/ folder, and delete all other models
#   (KNN and Logistic).
#
#   The model files are in the data/model_out subdirectory.
#   To rebuild the input files:
#       cd data
#       rm -rf model_out
#       rm -rf __MACOSX
#       unzip model_out.zip

set -euo pipefail

out_models=data/model_out/
tree_models=data/model_out/tree_models/
other_models=data/model_out/other_models/

# Create a directory for storing the desired files.
if [[ ! -d $tree_models ]]; then
    mkdir $tree_models
fi
if [[ ! -d $other_models ]]; then
    mkdir $other_models
fi

for file in ${out_models}*.csv; do
    case $(cat $file) in
        # "*Random Forest*" doesn't work
        *"Random Forest"*|*GBM*|*XGBoost*) mv $file $tree_models ;;
        *KNN*|*Logistic*) mv $file $other_models ;;
        *) echo "Unknown model in $file" ;;
    esac
done

echo "tree_models:"
ls $tree_models
echo "other_models:"
ls $other_models
