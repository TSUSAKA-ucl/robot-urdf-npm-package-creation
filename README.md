# nova2 on the IAI slider

This repository is of the same type as https://github.com/TSUSAKA-ucl/UR5e-example.git

```
# IAI用のmesh作成
cd IAI
unzip ~/Downloads/IAI_RCP6SA8RWA56SP51100P4PMLW8501050.zip 
meshlab RCP6-SA8R-WA-56SP-5-1100-P4-P-ML-W\(8501050\).stl 
# rotate and scale in meshlab
cd ..
#
# urdf.json作成準備
./clone.sh
./a/extract-joint-and-link-tag.sh chain_w_IAI.urdf
./a/cut-joint-map.sh urdfmap.json --from iai_link --to Link6
./a/extract-joint-and-link-tag.sh  chain_w_IAI.urdf -j urdfmap_cut.json 
# 
# nova2 ros2 package 作成
cd ros2/
colcon build --packages-select dobot_rviz
. install/setup.bash 
cd ..
#
# npmパッケージ用mesh作成
Meshes=(`./resolve_ros2_paths.sh linkmap.json | sort -u`)
cd meshes/
for path in "${Meshes[@]}"; do ln -s "$path" . ; done
../a/convert-to-gltf.sh *.STL *.stl
cd ..
#
# npmパッケージ作成 & publish
mkdir -p iai-nova2/public/iai-nova2
./copy-assets.sh . iai-nova2/public/iai-nova2/
cd iai-nova2/
pnpm init
../insert_files.sh 
pnpm publish
```
