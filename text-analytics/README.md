N-gram Language Models (Bigram & Trigram)

This project implements bigram and trigram language models from scratch for text modeling and generation tasks.

-) Features
Implemented bigram and trigram models
Applied Laplace smoothing for probability estimation
Used log-probabilities to avoid numerical underflow
Handled unknown words (UNK) and vocabulary filtering
Preprocessed text data (tokenization, sentence splitting)
📊 Evaluation

-) The models are evaluated using:

1. Cross-Entropy
2. Perplexity

Evaluation is performed on a test set treated as a single sequence, including end tokens while excluding start tokens from probability calculations.

-)  Text Generation

Implemented sentence autocomplete using:

Greedy decoding (most probable next word)
