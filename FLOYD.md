floyd run --gpu --env default --data randomquark/datasets/bayeux-rolling-windows-training/1:inputs 'python pix2pix.py --mode train --output_dir model --max_epochs 200 --input_dir /inputs --which_direction AtoB'

floyd run --gpu --data randomquark/datasets/bayeux-rolling-windows-testing:inputs --data tomchambers2/projects/pix2pix/24:files "python pix2pix.py \
 --mode test \
 --output_dir generated \
 --input_dir /inputs \
 --checkpoint /model/model"
