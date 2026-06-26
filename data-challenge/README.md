# Data Challenge

## Publication Venue Prediction

This project was developed as part of the **Data Challenge** course in the MSc Data Science & AI program.

The goal of the project is to predict the publication venue category of each scientific paper. Each paper is represented through multiple sources of information, including its abstract, authors, publication year, and citation/network connections.

## Problem Description

The task is a multi-class classification problem. Given information about a scientific paper, the objective is to predict the category or venue class to which the paper belongs.

This type of problem combines elements of:

* Natural Language Processing
* Graph-based learning
* Feature engineering
* Supervised machine learning
* Model evaluation and comparison

## Dataset

The dataset consists of the following files:

| File            | Description                                  |
| --------------- | -------------------------------------------- |
| `abstracts.txt` | Textual abstracts of the papers              |
| `edgelist.txt`  | Citation or graph connections between papers |
| `authors.txt`   | Author information for each paper            |
| `year.txt`      | Publication year of each paper               |

These files provide different types of information that can be used to build predictive features.

## Approach

The project explores how different sources of information can improve prediction performance.

The main steps include:

1. Loading and preprocessing the dataset
2. Extracting features from paper abstracts
3. Using graph-based information from the citation network
4. Incorporating author and year information
5. Training classification models
6. Evaluating model performance
7. Comparing different feature combinations and modeling approaches

## Repository Structure

```text
data-challenge/
├── README.md
├── notebooks/
├── data/
├── reports/
└── figures/
```

## Tools and Technologies

* Python
* pandas
* NumPy
* scikit-learn
* NetworkX
* NLP feature extraction
* Graph-based features
* Machine learning classifiers
