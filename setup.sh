#!/usr/bin/bash

echo lag .bashrc fil på brukerens hjemmappe
echo den filen må inneholde kca alias
absolute_path=$(pwd)
echo $absolute_path
# Add alias for kca_init if it doesn't exist
if ! grep -q "alias kca_init=" ~/.bashrc; then
    echo "alias kca_init='$absolute_path/scripts/init.sh'" >> ~/.bashrc
fi

# Add alias for kca_hotspots if it doesn't exist
if ! grep -q "alias kca_hotspots=" ~/.bashrc; then
    echo "alias kca_hotspots='$absolute_path/scripts/hotspots.sh'" >> ~/.bashrc
fi
source ~/.bashrc