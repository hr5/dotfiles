import os
import os.path

EXCLUDE_LIST = [".git", ".ropeproject", "install.py", "install.scm"]

def exclude(path):
    for e in EXCLUDE_LIST:
        if e in path:
            return True

    return False

src_path = os.environ["PWD"]
dest_path = os.environ["HOME"]

dir_paths = []
file_paths = []

for path, dirs, files in os.walk(src_path):
    for dir in dirs:
        dir_path = "{}/{}".format(path, dir)
        if not(exclude(dir_path)):
            dir_paths.append(dir_path)

    for file in files:
        file_path = "{}/{}".format(path, file)
        if not(exclude(file_path)):
            file_paths.append(file_path)

dest_dir_paths = []
dest_file_paths = []

for path in dir_paths:
    dest_dir_paths.append(path.replace(src_path, dest_path))

for path in file_paths:
    dest_file_paths.append(path.replace(src_path, dest_path))

for path in dest_dir_paths:
    print("Create path {}".format(path))
    os.makedirs(path, exist_ok=True)

assert len(dest_file_paths) == len(file_paths)
for src, dest in zip(file_paths, dest_file_paths):
    print("Make link from {} to {}".format(src, dest))
    if os.path.exists(dest):
        print("Path {} exists, ignored".format(dest))
        continue
    os.symlink(src, dest)
