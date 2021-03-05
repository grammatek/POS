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
pos \
train-lemmatizer \
"$TRAIN" \
"$TEST" \
"$OUT_DIR" \
--lemmatizer_hidden_dim 256 \
--lemmatizer_char_dim 64 \
--tag_embedding_dim 128 \
--char_lstm_layers 1 \
--char_lstm_dim 128 \
--char_emb_dim 64 \
--label_smoothing 0.1 \
--epochs 20 \
--batch_size 8 \
--save_vocab \
--save_model \
--optimizer sgd \
--learning_rate 5e-2 \
$*