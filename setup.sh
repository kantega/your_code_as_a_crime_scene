#!/usr/bin/bash

echo lag .bashrc fil på brukerens hjemmappe
echo den filen må inneholde kca alias
absolute_path=$(pwd)
echo $absolute_path
echo "alias kca_init='$absolute_path/scripts/init.sh'" >> ~/.bashrc
echo "alias kca_hotspots='$absolute_path/scripts/hotspots.sh'" >> ~/.bashrc
source ~/.bashrc