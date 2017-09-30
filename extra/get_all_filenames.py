import os
from fnmatch import fnmatch

list = []
root = '/media/sammer/Seagate Backup Plus Drive/activitNet/segments/frames-stable-many'
pattern = "*.jpg"

for path, subdirs, files in os.walk(root):
    for name in sorted(files):
        if fnmatch(name, pattern):
            list.append(os.path.join(path, name))

thefile = open('../data/list.txt','w')

for item in list:
    thefile.write("%s\n" %  item)

thefile.close()