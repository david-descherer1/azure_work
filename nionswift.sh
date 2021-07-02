#!/bin/bash
#Install Nionswift with EELS and Experimental Tools
conda update anaconda -y
conda create -n nionswift -c nion nionswift nionswift-Tool
conda activate nionswift
conda update -c nion --all
conda install -c nion nionswift-eels-analysis
conda install -c nion nionswift-experimental


#through conda forge
#dont set channel priotiy to strict?
conda update anaconda -y
conda config --add channels conda-forge
#conda config --set channel_priority strict
conda create -n nionswift -c conda-forge nionswift
conda activate nionswift
conda update -c nion --all -y
conda install -c nion nionswift-eels-analysis -y
conda install -c nion nionswift-experimental -y
conda install -c nion nionswift-tool -y