# Initial update
echo "-------- INITIAL UPDATE --------"
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install vim
sudo apt-get install git

if [[ $? != 0 ]]; then
	echo "Initial update error"
	exit 1
fi

# Installing python 3.6
echo "-------- PYTHON 3.6 DOWNLOAD --------"
cd /opt
wget https://www.python.org/ftp/python/3.6.3/Python-3.6.3.tgz

if [[ $? != 0 ]]; then
	echo "Python download error"
	exit 1
fi

tar -xvf Python-3.6.3.tgz
cd Python-3.6.3
./configure

if [[ $? != 0 ]]; then
	echo "Python configuration error"
	exit 1
fi

make 
make install

# in case of given error : zipimport.ZipImportError: can't decompress data; zlib not available
# apt-get install zlib1g-dev
# make 
# make install

# Update files
echo "-------- FILES UPDATE --------"
apt-get update

# Install python 3.6
echo "-------- PYTHON 3.6 INSTALLATION --------"
apt-get install python3.6

if [[ $? != 0 ]]; then
	echo "Python installation error"
	exit 1
fi

# Verification
# python3.6 -V

# Install pip
echo "-------- PIP INSTALLATION --------"
python3.6 get-pip.py

if [[ $? != 0 ]]; then
	echo "Pip installation error"
	exit 1
fi

# Upgrade
pip install -U pip

if [[ $? != 0 ]]; then
	echo "Pip upgrade error"
	exit 1
fi
