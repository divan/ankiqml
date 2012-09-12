import sys
import os
import hashlib
from os.path import join

# digsigsums.py generate DEBIAN/digsigsums for aegis on Meego 1.2 Harmattan
# it is meant to be run just before dpkg -b with the package name as parameter
# builds the digsigsums file in $packagename/DEBIAN/

def check_file(filePath):
    fh = open(filePath, 'r')
    if fh.read(2) == '#!':
        fh.close()
        return True
    fh.close()
    return False
        
def hash_file(filePath, packageName):
    # digsigsums format:
    # S 15 com.nokia.maemo H 40 xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx R 5 abcde
    # Source (might change) hash (sha1)                                 relative path
    if 'DEBIAN/' in filePath:
        relativepath = 'var/lib/dpkg/info/{0}.{1}'.format(packageName, filePath[7+len(packageName):])
    else:
        relativepath = filePath[len(packageName):]

    fileToHash = open (filePath, 'rb')
    sha1 = hashlib.sha1()
    sha1.update(fileToHash.read())
    hashString = sha1.hexdigest()
    fileToHash.close()
    return 'S 15 com.nokia.maemo H 40 {0} R {1} {2}\n'.format(hashString, len(relativepath), relativepath)


if(len(sys.argv) > 1):
    packageName = sys.argv[1]
    
    # generate DEBIAN/digsigsums for control.tar.gz
    digsigsums = open(packageName+'/DEBIAN/digsigsums', 'w')
    for path, dirs, files in os.walk(packageName):
        for filename in files:
            if check_file(join(path,filename)):
                digsigsums.write(hash_file(join(path,filename), packageName))
                    
    digsigsums.close()
