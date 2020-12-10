#!/bin/bash
 
# Declare an array of string with type
# declare -a adv=("autoattack" "bim" "cw" "deepfool" "ffgsm" "fgsm" "mifgsm" "newtonfool" "pgd" "jsma" "spatialtransformation" "squareattack" "tpgd")

# declare -a adv=("mifgsm" "pgd" "spatialtransformation" "squareattack" "tpgd")

# declare -a adv=("autoattack" "fgsm" "pgd" "bim" "cw")
# declare -a adv=("autopgd" "squareattack" "jsma")
# declare -a adv=("deepfool" "newtonfool")
declare -a adv=("pixelattack" "spatialtransformation")

# Iterate the string array using for loop
for a in ${adv[@]}; do
    python adversarial_training.py --model resnet18 \
        --attack $a \
        --lr-schedule piecewise \
        --norm l_inf \
        --epsilon 8 \
        --epochs 110 \
        --attack-iters 10 \
        --pgd-alpha 2 \
        --fname auto \
        --optimizer 'momentum' \
        --weight_decay 5e-4 \
        --batch-size 256 \
        --BNeval 
done

# python adversarial_training.py --model resnet18 \
#     --attack pgd \
#     --lr-schedule piecewise \
#     --norm l_inf \
#     --epsilon 8 \
#     --epochs 110 \
#     --attack-iters 10 \
#     --pgd-alpha 2 \
#     --fname auto \
#     --optimizer 'momentum' \
#     --weight_decay 5e-4 \
#     --batch-size 128 \
#     --BNeval 