#!/bin/sh

# install Google protobuf OpenCV
sudo apt-get install libprotobuf-dev libleveldb-dev libsnappy-dev libhdf5-serial-dev protobuf-compiler
sudo apt-get install libopencv-dev python-opencv

#install BOOST
sudo apt-get install --no-install-recommends libboost-all-dev

#BLAS, install ATLAS for it
sudo apt-get install libatlas-base-dev

#google glog, gflags, lmdb
sudo apt-get install libgflags-dev libgoogle-glog-dev liblmdb-dev

#PYTHON dev for all other python dependeny
sudo apt-get install python-dev

#python image
sudo apt-get install python-skimage

#PIP to install numpy, scipy etc
sudo apt-get install pip

sudo pip install numpy
sudo pip install Cython
sudo pip install scipy
sudo pip install scikit-image
sudo pip install matplotlib
sudo pip install ipython
sudo pip install h5py
sudo pip install leveldb
sudo pip install networkx
sudo pip install nose
sudo pip install pandas
sudo pip install python-dateutil
sudo pip install protobuf
sudo pip install python-gflags
sudo pip install pyyaml
sudo pip install Pillow
sudo pip install six

#download latest caffe from github
git clone https://github.com/BVLC/caffe.git
#cd caffe/python
#for req in $(cat requirements.txt); do pip install $req; done
#cd ..

#change directory to caffe folder
cd caffe
mkdir build
cd build
cmake ..
make -j4 && make pycaffe
cd ..

#add your python binding to PYTHONPATH
cd python 
export PYTHONPATH=$PYTHONPATH:$PWD
