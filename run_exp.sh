
python run_entity.py \
    --do_train \
    --do_eval  \
    --eval_test  \
    --learning_rate=1e-5 --task_learning_rate=5e-4 \
    --train_batch_size=16 \
    --context_window 0 \
    --task scierc \
    --data_dir /uusoc/exports/scratch/yyzhuang/PURE/scierc_data/processed_data/json \
    --model bert-base-uncased \
    --output_dir ./temp/entity


python run_relation.py \
  --task scierc\
  --do_train \
  --do_eval --eval_with_gold \
  --train_file scierc_data/processed_data/json/train.json \
  --val_file scierc_data/processed_data/json/dev.json \
  --model bert-base-uncased \
  --do_lower_case \
  --train_batch_size 32 \
  --eval_batch_size 32 \
  --learning_rate 2e-5 \
  --num_train_epochs 10 \
  --context_window 0	\
  --max_seq_length 228 	\
  --output_dir ./temp/rel

python run_relation.py \
  --task mars\
  --do_train \
  --do_eval --eval_with_gold \
  --train_file /uusoc/res/nlp/nlp/yuan/mars/transform_data_for_other_models/pure_data/train/EM.extracted_gold_docs.json \
  --val_file /uusoc/res/nlp/nlp/yuan/mars/transform_data_for_other_models/pure_data/val/EM.extracted_gold_docs.json \
  --model bert-base-uncased \
  --do_lower_case \
  --train_batch_size 32 \
  --eval_batch_size 32 \
  --learning_rate 2e-5 \
  --num_train_epochs 10 \
  --context_window 0	\
  --max_seq_length 228 	\
  --output_dir ./temp/rel
  # --entity_output_dir {path to output files of the entity model} \
