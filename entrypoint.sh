#!/bin/bash

echo "Installed software:"
python3 --version
pip --version
jupyter --version

echo
echo "Installed Python packages:"
pip list -l

echo
if [ ! -d /workspace/notebooks ]
then
    cp -r /notebooks /workspace
fi
chmod 777 -R /workspace
jupyter lab --allow-root --ip=0.0.0.0 --no-browser
