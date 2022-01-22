#/bin/bash
if [ -d ~/testdir ]; then
   echo "directory found and now copying files, please wait ..."
else
   echo "Warning: directory NOT found.Creating one"
   mkdir ~/testdir
fi
echo "hwllo world" >> ~/testdir/output.txt
echo  $(date) >> ~/testdir/output.txt
