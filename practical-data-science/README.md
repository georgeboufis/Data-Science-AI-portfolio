# Practical Data Science Projects

This repository contains projects developed as part of the MSc in Data Science & AI (AUEB), focusing on building end-to-end machine learning pipelines on real-world data.

The work demonstrates a progression from classical machine learning approaches to more advanced hybrid and deep learning systems.

---

##  Project I: Surface Detection on Vesuvius CT Volumes (Baseline)

End-to-end supervised learning pipeline for detecting surfaces in 3D CT scan data.

### Pipeline
- Data acquisition and preprocessing of volumetric data
- Exploratory Data Analysis (EDA)
- Patch-based supervised learning setup
- Baseline models:
  - Logistic Regression
  - Random Forest
  - Gradient Boosting

### Key Libraries
- `numpy`, `pandas` → data handling  
- `matplotlib`, `seaborn` → visualization  
- `scikit-learn` → baseline models & evaluation  

### Key Challenges
- High noise in CT scans  
- Severe class imbalance  
- Limited spatial awareness in pixel-wise models  

### Outcome
Established strong baselines and identified limitations of classical approaches.

---

##  Project II: Hybrid Surface Detection (Advanced)

Improved surface detection using a hybrid ensemble combining deep learning and classical machine learning.

### Approach
- Transition from patch-based → full-image modeling
- Dual-stream architecture:
  - **U-Net (Deep Learning)** → spatial structure  
  - **XGBoost** → handcrafted features (edges, texture)  
- Ensemble blending (60% U-Net, 40% XGBoost)

### Key Libraries
- `torch` / `torchvision` → U-Net implementation  
- `xgboost` → gradient boosting model  
- `opencv` / `scipy` → feature extraction (edges, filters)  
- `numpy` → data manipulation  

### Results
- Significant improvement in F1-score and IoU
- Near-perfect recall (≈1.0)
- Better spatial consistency

### Key Insight
Combining **deep learning (structure)** with **feature-based models (texture)** leads to more robust predictions.

---

##  Evolution Across Projects

| Stage | Approach | Key Idea |
|------|--------|--------|
| Baseline | Classical ML | Understand the problem & limitations |
| Advanced | Hybrid DL + ML | Combine structure + texture |

---

##  Skills Demonstrated

- End-to-end ML pipelines
- Feature engineering & preprocessing
- Model evaluation & error analysis
- Classical ML (scikit-learn, XGBoost)
- Deep Learning (PyTorch, U-Net)
- Handling noisy, high-dimensional data
- Experimental design and benchmarking

---

##  Tech Stack

- Python
- NumPy, Pandas
- Scikit-learn
- XGBoost
- PyTorch
- OpenCV / SciPy
- Matplotlib / Seaborn




