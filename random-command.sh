floyd run --gpu --env default --data randomquark/datasets/bayeux-rolling-2-train/1:inputs "python pix2pix.py --mode train --output_dir model --max_epochs 200 --input_dir /inputs --which_direction AtoB"



floyd run --gpu --data randomquark/datasets/bayeux-rolling-2-generated/2:inputs --data randomquark/projects/python tools/dockrun.py python pix2pix.py \
      --mode test \
      --output_dir facades_test \
      --input_dir facades/val \
      --checkpoint facades_train


randomquark/datasets/bayeux-rolling-2-generated/2



floyd run --gpu --env default --data randomquark/projects/pix2pix/33:trained --data randomquark/datasets/colornoisetest:inputs 'python pix2pix.py --mode test --output_dir generated --input_dir /inputs --checkpoint /trained/model'


montage -geometry 256x256-32 -tile x1  *.png montage-overlap.png