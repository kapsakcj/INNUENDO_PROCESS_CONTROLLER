#get job ids
squeue --job $1 | sed "1d" | sed "s/ \+/\t/g" | cut -f5