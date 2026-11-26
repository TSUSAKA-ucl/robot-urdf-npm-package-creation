// 元のSTLを読み込む
import("base_link.STL");
depth=0.4;
tIAI=0.071;
offset=0.06;
// 座標 [x, y, z] に移動し、サイズ [幅, 奥行, 高さ] の直方体を追加
translate([tIAI-depth, -0.1, -0.02])
    cube([depth+offset-tIAI, 0.2, 0.02]);

// openscad --export-format binstl -o base_link_bracket.stl add_box.scad