echo "This script will install Network Simulator on this computer"
cd Desktop
wget "https://sourceforge.net/projects/nsnam/files/latest/download"
sudo apt update
sudo apt-get install build-essential autoconf automake libxmu-dev gnuplot default-jre
sudo apt install gcc-4.8 g++-4.8
tar zxvf nsallinone-2.35.tar.gz
cd Desktop/ns-allinone-2.35/ns-2.35/linkstate

#sudo apt install ns2
#sudo apt install nam
#sudo apt install default-jre
#Specify the path where nsallinone package is extracted
#Make sure the path is correct here
sed -i '/void eraseAll(){erase(baseMap::begin(),baseMap::end());}/c\void eraseAll(){this->erase(baseMap::begin(),baseMap::end());}' /Desktop/ns-allinone-2.35/ns-2.3.5/linkstate/ls.h
sed -i '/CC @CC@/c\CC=gcc-4.8'  /Desktop/ns-allinone-2.35/ns-2.3.5/Makefile.in
sed -i '/CPP @CXX@/c\CPP=g++-4.8'  /Desktop/ns-allinone-2.35/ns-2.3.5/Makefile.in
sed -i '/CC @CC@/c\CC=gcc-4.8'  /Desktop/ns-allinone-2.35/nam-1.15/Makefile.in
sed -i '/CPP @CXX@/c\CPP=g++-4.8'  /Desktop/ns-allinone-2.35/nam-1.15/Makefile.in
sed -i '/CC @CC@/c\CC=gcc-4.8'  /Desktop/ns-allinone-2.35/otcl-1.14/Makefile.in
sed -i '/CC @CC@/c\CC=gcc-4.8'  /Desktop/ns-allinone-2.35/xgraph-12.2/Makefile.in
sed -i '/CPP @CXX@/c\CPP=g++-4.8'  /Desktop/ns-allinone-2.35/xgraph-12.2/Makefile.in
cd ns-allionone-2.35
./install
#add the fi             //the text after add here
pdw=$(pwd)
cat ~/.bashrc>>"
#LD_LIBRARY_PATH
OTCL_LIB=$(pwd)/otcl-1.14/
NS2_LIB=$(pwd)/lib/
USR_Local_LIB=/usr/local/lib/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$OTCL_LIB:$NS2_LIB:$USR_Local_LIB

#TCL_LIBRARY
TCL_LIB=$(pwd)/tcl8.5.10/library/
USR_LIB=/usr/lib/
export TCL_LIBRARY=$TCL_LIBRARY:$TCL_LIB:$USR_LIB

#PATH
XGRAPH=$(pwd)/xgraph-12.2/:/$(pwd)/bin:$(pwd)/tcl8.5.10/unix/:$(pwd)/tk8.5.10/unix/
NS=$(pwd)/ns-2.35/
NAM=$(pwd)/nam-1.15/
export PATH=$PATH:$XGRAPH:$NS:$NAM
"
source ~/.bashrc
cd
ns
%exit
nam
java -jar NSG2.jar
