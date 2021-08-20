#!/usr/bin/python3

import cgi
import subprocess

print("content-type: text/html")
print()

receiver_ = cgi.FieldStorage()
container_name = receiver_.getvalue("cont_name")
image_name = receiver_.getvalue("img_name")
container_remove = receiver_.getvalue("remCont")
image_remove = receiver_.getvalue("remImg")
show_containers = receiver_.getvalue("showCont")
show_images = receiver_.getvalue("showImg")

if container_name and image_name:
    o = subprocess.getoutput(f'docker run --name {container_name} {image_name}')
    print(o)

if container_remove:
    o = subprocess.getoutput(f'docker rm {container_remove}')
    print(o)

if image_remove:
    o = subprocess.getoutput(f'docker rmi {image_remove}')
    print(o)

if show_containers:
    o = subprocess.getoutput(f'docker ps')
    print(o)

if show_images:
    o = subprocess.getoutput(f'docker images')
    print(o)