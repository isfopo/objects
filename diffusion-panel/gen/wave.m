1;
offset = 10;
d = (sin(0:1.8:18)' * sin(0:1.8:8)) * 10 + 12;
save("-ascii", "off10.dat", "d");