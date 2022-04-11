#!/bin/bash -i

# Declare environment storage location
env_loc="envs" # local env folder within repository

env_name="ligo"

env_loc_full=~/$env_loc/$env_name


# Make envs folder if it doesn't exist
if [ ! -d $HOME/$env_loc ]; then
	mkdir $HOME/$env_loc
fi

# Create environment for STAT 159, HW5
if [ ! -d $env_loc_full ]; then
	mamba env create -f environment.yml -p $env_loc_full
	mamba env update --file environment.yml --prune
	conda activate $env_loc_full
	python -m ipykernel install --user --name $env_name --display-name "IPython - $env_name"
fi
