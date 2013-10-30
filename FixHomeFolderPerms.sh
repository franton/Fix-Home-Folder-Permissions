#!/bin/bash

# Script to reset current user's home folder permissions to default

# Author      : r.purves@arts.ac.uk
# Version 1.0 : 27-03-2013 - Initial Version

# Current local admin account name

localadmin="uadmin"

# Read current user into $i variable

i=$( echo $3 )

# Check to see if the user is our local admin account and fix accordingly.

if [ "$i" == "$localadmin" ];
then

   echo "Processing uadmin account"

   chown -R $i:staff /Users/$i
   chmod 755 /Users/$i
   chmod -R 700 /Users/$i/Desktop/
   chmod -R 700 /Users/$i/Documents/
   chmod -R 700 /Users/$i/Downloads/
   chmod -R 700 /Users/$i/Library/
   chmod -R 700 /Users/$i/Movies/
   chmod -R 700 /Users/$i/Pictures/
   chmod 755 /Users/$i/Public/
   chmod -R 733 /Users/$i/Public/Drop\ Box/

   echo "Completed!"

fi

# If not our local admin account, run our AD user permissions fix instead.

if [ "$i != $localadmin" ];
then

   echo "Processing" $i

   chown -R $i:"ARTSLOCAL\Domain Users" /Users/$i
   chmod 755 /Users/$i
   chmod -R 700 /Users/$i/Desktop/
   chmod -R 700 /Users/$i/Documents/
   chmod -R 700 /Users/$i/Downloads/
   chmod -R 700 /Users/$i/Library/
   chmod -R 700 /Users/$i/Movies/
   chmod -R 700 /Users/$i/Pictures/
   chmod 755 /Users/$i/Public/
   chmod -R 733 /Users/$i/Public/Drop\ Box/

   echo "Completed!"

fi

# All done!

exit 0
