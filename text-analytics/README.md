## Text Analytics Projects

Implemented using PyTorch and modern NLP libraries.

A collection of NLP projects demonstrating the evolution of text classification models, from statistical approaches to deep learning and transformer-based architectures.

---

### Projects

1. **N-grams**  
   Bigram & trigram language models with Laplace smoothing and text generation  
   - Libraries: `nltk`, `numpy`

2. **MLP**  
   Feedforward neural network for text classification using TF-IDF features  
   - Libraries: `scikit-learn`, `numpy`, `torch`

3. **RNN + Attention**  
   BiLSTM / GRU models with self-attention for capturing sequential dependencies  
   - Libraries: `torch`, `gensim` (Word2Vec), `nltk`

4. **CNN**  
   Text classification using convolutional filters over n-grams with pooling  
   - Libraries: `torch`, `numpy`

5. **BERT**  
   Fine-tuned transformer model for sentiment classification  
   - Libraries: `transformers`, `datasets`, `torch`, `peft` (LoRA)

---

### Key Techniques & Tools

- Text preprocessing: `nltk`, `re`, `html`
- Feature extraction: TF-IDF (`scikit-learn`)
- Word embeddings: `gensim` (Word2Vec)
- Deep learning: `PyTorch`
- Transformers & fine-tuning: `HuggingFace Transformers`, `PEFT (LoRA)`

---

### Summary

Progression from **statistical models → neural networks → transformers**, highlighting increasing ability to capture context, semantics, and long-range dependencies in text data.
