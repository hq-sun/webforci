#/bin/bash

old_vender="nvidia"
new_vender="cambricon"
old_chip="H100_80_SXM"
new_chip="MLU590_M9"

file_path="config.yaml"
sed -i "s/${old_vender}/${new_vender}/g" "${file_path}"
sed -i "s/${old_chip}/${new_chip}/g" "${file_path}"

echo "Replaced'${old_vender}'with '${new_vender}' and '${old_chip}' with '${new_chip}'in '${file_path}'"
