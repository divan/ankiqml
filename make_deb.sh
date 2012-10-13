#!/bin/sh

VERSION=0.1.0
DEB_NAME=ankiqml-$VERSION-1_i386.deb
BUILD_DIR=./build
APP_DIR=$BUILD_DIR/opt/ankiqml
USR_DIR=$BUILD_DIR/usr/share

echo "Cleaning up..."
rm -rf $APP_DIR

echo "Copying files to ./build..."
mkdir -p $APP_DIR
mkdir -p $APP_DIR/bin
mkdir -p $APP_DIR/qml
mkdir -p $USR_DIR
mkdir -p $USR_DIR/applications
mkdir -p $USR_DIR/icons/hicolor/64x64/apps
cp -fv ./ankiqml $APP_DIR/bin/
cp -fa ./images $APP_DIR 
cp -fa ./anki $APP_DIR 
cp -fa ./qml/* $APP_DIR/qml/
cp -f ./ankiqml.png $USR_DIR/icons/hicolor/64x64/apps/
cp -f ./ankiqml.desktop $USR_DIR/applications/

echo "Calculating digsigsums..."
python $BUILD_DIR/digsigsums.py ./build/

echo "Building deb..."
if [ $(uname -n) != "RM680" ]; then
   fakeroot tar -C $BUILD_DIR -czf $BUILD_DIR/data.tar.gz opt/ usr/
else
   fakeroot -l /usr/lib/libfakeroot/libfakeroot-sysv.so -- tar -C $BUILD_DIR -czf $BUILD_DIR/data.tar.gz opt/ usr/
fi
tar -C $BUILD_DIR/DEBIAN -czf $BUILD_DIR/control.tar.gz .
ar -r $DEB_NAME $BUILD_DIR/debian-binary \
    $BUILD_DIR/control.tar.gz \
    $BUILD_DIR/data.tar.gz
#rm -rf $BUILD_DIR/control.tar.gz $BUILD_DIR/data.tar.gz

echo "Cleaning up..."
rm -f $BUILD_DIR/DEBIAN/digsigsums
rm -rf $APP_DIR
rm -rf $USR_DIR

echo "Done."
echo "deb-file stored at: ./$DEB_NAME"

exit 0
