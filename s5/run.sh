 #!/bin/bash
set -e
stage=0
. ./cmd.sh
. utils/parse_options.sh

for x in all_data; do
    steps/make_mfcc_vox.sh --cmd "$train_cmd" --nj 20 data/$x || exit 1;
    steps/compute_cmvn_stats.sh data/$x || exit 1;
done
  