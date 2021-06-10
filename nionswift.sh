#Install Nionswift with EELS and Experimental Tools
conda update anaconda
conda create -n nionswift -c nion nionswift nionswift-Tool
conda activate nionswift
conda update -c nion --all
conda install -c nion nionswift-eels-analysis
conda install -c nion nionswift-experimental
