# set log path as the date and time
LOG="/gpfs/alpine/scratch/wuyusong/csc499/clap_data/audio_clip_logs/clap_log_$(date +%Y%m%d_%H%M%S).log"
unset CUDA_VISIBLE_DEVICES

export NUMBA_CACHE_DIR=/tmp/

export OMP_NUM_THREADS=7

export HOROVOD_CACHE_CAPACITY=0

export WANDB_DIR=/gpfs/alpine/scratch/wuyusong/csc499/clap_data/audio_clip_logs_wandb
export WANDB_CONFIG_DIR=/gpfs/alpine/scratch/wuyusong/csc499/clap_data/audio_clip_logs_wandb
export WANDB_MODE=offline
wandb offline
# Export need to be strictly before than wandb offline

python -m evaluate.eval_retrieval_main \
    --datasetpath /gpfs/alpine/scratch/wuyusong/csc499/clap_data/webdataset_tar \
    --datasetnames "Clotho" "audiocaps" "BBCSoundEffects" "audioset" "free_to_use_sounds" "paramount_motion" "sonniss_game_effects" "wesoundeffects" \
    --report-to "wandb" \
    --dataset-type="webdataset" \
    --batch-size=96 \
    --workers=4 \
    --openai-model-cache-dir /gpfs/alpine/scratch/wuyusong/csc499/clap_data/.cache/clip \
    --resume /gpfs/alpine/scratch/wuyusong/csc499/clap_data/audio_clip_logs/2022_08_28-17_16_16-model_HTSAT-tiny-lr_0.001-b_96-j_4-p_fp32_fewer_checkpoints/checkpoints/epoch_latest.pt