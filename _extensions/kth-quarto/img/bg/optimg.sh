#!/bin/bash
mogrify -thumbnail 800 -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -define png:exclude-chunk=all -interlace none -colorspace gray -matte -channel A +level 0,70% +channel *.png
optipng *.png
