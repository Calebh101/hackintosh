#!/bin/bash
# V. 1.0.0 (Linux)

echo "Starting ProperTree..."
python3 /home/caleb/hackintosh/propertree/ProperTree.py /home/caleb/hackintosh/EFI/hackintosh/EFI/HP-Notebook-by-1022cl/EFI/OC/config.plist

echo "Preparing to copy EFI..."
rm -rf /media/caleb/ESP/EFI

echo "Copying new EFI..."
cp -r /home/caleb/hackintosh/EFI/hackintosh/EFI/HP-Notebook-by-1022cl/EFI /media/caleb/ESP/EFI

read -p "Commit message (leave empty to skip): > " message
cd /home/caleb/hackintosh/EFI/hackintosh

if [[ -n "$message" ]]; then
	echo "Pushing to GitHub..."
	git stage .
	git commit -m "$message"
	git push
fi

echo "Process complete"
exit 0
