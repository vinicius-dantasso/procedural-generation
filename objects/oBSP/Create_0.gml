//randomize();

root = new Node(x, y, BMAP_W, BMAP_H);
split(root, global.bdepth);
generate_rooms(root);
connect_rooms(root);

