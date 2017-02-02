#!/bin/sh

#update your packages
sudo apt-get -y update

#CMake
sudo apt-get install -y build-essential cmake

#Qt for graphical development
sudo apt-get install -y qt5-default libvtk6-dev

#some library for image format 
sudo apt-get install -y zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libjasper-dev libopenexr-dev libgdal-dev

#library for video
sudo apt-get install -y libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev yasm libopencore-amrnb-dev libopencore-amrwb-dev libv4l-dev libxine2-dev

#intel TBB for parallel computing and EIGEN3 for matrix operations
sudo apt-get install -y libtbb-dev libeigen3-dev

#python stuffs
sudo apt-get install -y python-dev python-tk python-numpy python3-dev python3-tk python3-numpy

#OPECV java binding
sudo apt-get install -y ant default-jdk

#CUDA support
#first copy the nvidia cuba lib to usr/local
ln -s /usr/lib/nvidia-346/libnvcuvid.so /usr/lib/libnvcuvid.so && ln -s /usr/lib/nvidia-346/libnvcuvid.so.1 /usr/lib/libnvcuvid.so.1
#Set build with cuda (in the CMakeLists.txt file )as ON
sudo apt-get install -y unzip
wget https://github.com/Itseez/opencv/archive/3.0.0.zip
unzip 3.0.0.zip
rm 3.0.0.zip
mv opencv-3.0.0 OpenCV
cd OpenCV
mkdir build
cd build
cmake -DWITH_QT=ON -DWITH_OPENGL=ON -DFORCE_VTK=ON -DWITH_TBB=ON -DWITH_GDAL=ON -DWITH_XINE=ON -DBUILD_EXAMPLES=ON ..
make -j4
sudo make install
sudo ldconfig

#RUn one examples to validate
cd bin
./cpp-example-edge ../../samples/data/fruits.jpg


