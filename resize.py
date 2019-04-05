import os
import subprocess

path_to_images = '/Users/tomchambers/projects/machine_learning_art/nude-pix2pix/denseposed/output'

images = os.listdir(path_to_images)
image_paths = [path for path in images if 'pdf' in path]

image_packages = [{"name": path.split('.')[0], "pdf_name": path}
                  for path in image_paths]


def escape_url(url):
    return path.replace(' ', '\ ')


for path_package in image_packages:
    path = path_package["name"]
    escaped_path = escape_url(path)
    full_path = path_to_images + '/' + escaped_path
    pdf_name = path_package["pdf_name"]
    subprocess.call(["magick", "montage", "-geometry", '256x256',
                     f"{full_path}_IUV.png", path_to_images + '/' + pdf_name, f"{path_to_images}/paired/{escaped_path}_out.png"])
