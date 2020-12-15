#!/bin/bash
OUT_DIR=$1
TRAIN=$2
TEST=$3

mkdir -p $OUT_DIR
echo $OUT_DIR
echo $TRAIN
echo $TEST
shift; shift; shift
echo $*
#    --morphlex_embeddings_file data/extra/dmii.vectors_filtered \
#    --morphlex_freeze \
#    --pretrained_word_embeddings_file data/extra/igc2018.vec_filtered \
#    --known_chars_file data/extra/characters_training.txt \
#    --label_smoothing 0.1 \
#    --main_lstm_layers 2 \
#    --word_embedding_dim 128 \
#    --pretrained_model_folder bull \
# --lemmatizer \
# --known_chars_file data/extra/characters_training.txt \
# --char_lstm_layers 1 \
# --char_emb_dim 64 \
# --main_lstm_layers 1 \
# --main_lstm_dim 128 \
# --bert_encoder roberta \
# --bert_encoder_dim 768 \
pos \
train-and-tag \
"$TRAIN" \
"$TEST" \
"$OUT_DIR" \
--tagger \
--bert_encoder roberta \
--bert_encoder_dim 768 \
--bert_encoder_length 514 \
--main_lstm_dim 384 \
--main_lstm_layers 1 \
--label_smoothing 0.1 \
--epochs 10 \
--batch_size 16 \
--save_vocab \
--save_model \
--optimizer sgd \
--learning_rate 5e-2 \
$*