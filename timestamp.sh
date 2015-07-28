#!/bin/bash

for img in *.jpg; do

   width=$(identify -format %W ${img})
   width=$(( ${width} * 9 / 10 ))

   #turn "20150610_151544.jpg" into "2015-06-10 15:15:44" (for caption)
   formatted=$(echo ${img:0:4}-${img:4:2}-${img:6:2} ${img:9:2}:${img:11:2}:${img:13:2})
   echo ${formatted};

   convert                  \
     -background '#0008'    \
     -gravity center        \
     -fill white            \
     -size ${width}x100     \
      caption:"${formatted}"      \
      "${img}"              \
     +swap                  \
     -gravity south         \
     -composite             \
      "with-caption-${img}"

done
