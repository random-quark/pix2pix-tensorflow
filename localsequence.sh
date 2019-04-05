for i in {1..10}
do
    python pix2pix.py --mode test --output_dir results --input_dir ./source --checkpoint ./trained --which_direction AtoB
    mv ./source/end.png ./sequence/sequence-$i.png
    cp ./results/images/end-outputs.png ./source/end.png
done