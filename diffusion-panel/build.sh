#!/bin/bash
for i in $( seq 1 $1); do
  openscad -o build/panel_${i}.stl index.scad
done

openscad -D make_lock=true -o build/locks.stl index.scad
