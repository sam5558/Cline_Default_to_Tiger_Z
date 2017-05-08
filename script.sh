#This is a little script to help me convert standard cline into a usable format for my TIGER Z receiver for CCcam keys.
# coded by salim
# 2017
#
# fecth file from any source
wget http://www.mokisat.us/wp-content/uploads/cccamCfg/3/CCcam.cfg
# change order variables
awk '{print $1,$3,$2,$4,$5}' < CCcam.cfg > cccam.txt
# remove original file
rm CCcam.cfg
# Change C: to {c,
sed -i -e 's/C: /{c,/g' cccam.txt
# Change blank space to ,
sed -i -e 's/ /,/g' cccam.txt
# Add } in EOL and store the result in a new file
sed -i -e '/{c/ s/$/}/' cccam.txt
sed -i -e 's/\r//g' cccam.txt
# copy to windows
cp -u cccam.txt /mnt/d/cccam/
# remove file from linux
rm cccam.txt
# END
