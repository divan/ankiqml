from distutils.core import setup
import os, sys, glob

def read(fname):
    return open(os.path.join(os.path.dirname(__file__), fname)).read()

def opj(*args):
    path = os.path.join(*args)
    return os.path.normpath(path)

def find_data_files(srcdir, *wildcards, **kw):
    # get a list of all files under the srcdir matching wildcards,
    # returned in a format to be used for install_data
    def walk_helper(arg, dirname, files):
        names = []
        lst, wildcards = arg
        for wc in wildcards:
            wc_name = opj(dirname, wc)
            for f in files:
                filename = opj(dirname, f)

                if not os.path.isdir(filename):
                    names.append(filename)
        if names:
            lst.append( ("share/ankiqml/"+dirname, names ) )

    file_list = []
    recursive = kw.get('recursive', True)
    if recursive:
        os.path.walk(srcdir, walk_helper, (file_list, wildcards))
    else:
        walk_helper((file_list, wildcards),
                    srcdir,
                    [os.path.basename(f) for f in glob.glob(opj(srcdir, '*'))])
    return file_list

anki_files = find_data_files('anki/', '*')
anki_files += [
               ('share/applications', ['ankiqml.desktop']),
               ('share/icons/hicolor/64x64/apps', ['ankiqml.png']),
               ('share/ankiqml/qml', glob.glob('qml/*.qml')),
              ]

print anki_files

#      data_files=[('share/applications',['ankiqml.desktop']),
#                  ('share/icons/hicolor/64x64/apps', ['ankiqml.png']),
#		  anki_files,
#                  ('share/ankiqml/qml', glob.glob('qml/*.qml')), ],)
setup(name="ankiqml",
      scripts=['ankiqml'],
      version='0.1.0',
      maintainer="Ivan Daniluk",
      maintainer_email="ivan.daniluk@gmail.com",
      description="Anki QML",
      long_description=read('ankiqml.longdesc'),
      data_files=anki_files)
