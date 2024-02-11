#!/bin/bash

# Tutorial: Setting up LAMMPS and VMD on Ubuntu

# Check Linux Version
lsb_release -a

# Install necessary dependencies. Run this in case of failed instllations 
# sudo apt update
# sudo apt install build-essential libopenmpi-dev libfftw3-dev libvtk7-dev

# Download LAMMPS and VMD
# LAMMPS: https://lammps.sandia.gov/download.html
# VMD: https://www.ks.uiuc.edu/Research/vmd/

# Navigate to your desired directory to download LAMMPS and VMD
cd ~/Downloads

# Download LAMMPS
wget https://lammps.sandia.gov/tars/lammps-stable.tar.gz

# Download VMD. Download the appropriate version based on your system configuration from the VMD website
wget https://www.ks.uiuc.edu/Research/vmd/vmd-1.9.4/files/alpha/vmd-1.9.4a48.bin.LINUXAMD64-CUDA10-OptiX600-OSPRay150.opengl.tar.gz

# Extract LAMMPS
tar -xzvf lammps-stable.tar.gz

# Extract VMD
tar -xzvf vmd-1.9.4a48.bin.LINUXAMD64-CUDA10-OptiX600-OSPRay150.opengl.tar.gz

# Install LAMMPS
cd lammps-stable
mkdir build && cd build
cmake ../cmake
make -j4 # Replace '4' with the number of CPU cores you want to utilize

# Install VMD
cd ~/Downloads/vmd-1.9.4a48
sudo ./configure
sudo ./make distrib

# Add lmp to PATH (Optional)
echo 'Manually add the lmp path to your PATH variable'
source ~/.bashrc

echo "LAMMPS and VMD have been successfully installed!"

# Clean up downloaded files
rm ~/Downloads/lammps-stable.tar.gz
rm -rf ~/Downloads/lammps-stable
rm ~/Downloads/vmd-1.9.4a48.bin.LINUXAMD64-CUDA10-OptiX600-OSPRay150.opengl.tar.gz
rm -rf ~/Downloads/vmd-1.9.4a48

# Note: Replace '/path/to/vmd_directory' with the actual path where VMD is located.
# Also, make sure to follow any specific instructions provided with the downloaded packages for installation and configuration.
