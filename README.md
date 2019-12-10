# Exchangeability in Dependence Modelling
Author: Gian Carlo Di-Luvi \
STAT 547C final project \
UBC Statistics \
Github template adapted from Dr. Ben Bloem-Reddy

## Abstract
Exchangeability is a fundamental concept in probability theory which has profound theoretical implications, amongst them de Finetti's representation theorem. Essentially, any exchangeable sequence---one that is distribution-invariant under finite permutations---can be represented as conditionally independent given a unique measure. However, in situations in which the process of interest depends on a sequence of covariates, exchangeability is seldom satisfied. Multiple extended notions of exchangeability have been proposed to overcome this, with some of them even having de Finetti-like representation theorems. We study three specific notions of exchangeability that play a central role in dependence modelling: partial, local, and regression exchangeability. We argue that there is a trade-off between how adequate each notion is and how powerful it can be in terms of theoretical implications. Furthermore, we do an in-depth study of these concepts in the context of Gaussian process regression, finding that most of the expanded notions of exchangeability are satisfied by it. This means that representation theorems for Gaussian processes do exist, and simple modifications of the arguments we present generalize this for other models for statistical dependence. Whether a Gaussian process has noisy observations or not also plays a central role in determining its exchangeability, which hints at a stark difference between models with and without replicates. Lastly, we conjecture a representation theorem for regression exchangeability which *(i)* to the best of our knowledge does not yet exist and *(ii)* would make this relatively new notion a powerful theoretical tool for regression analysis.


## Directory roadmap
Each directory includes its own README file. In general:
* `doc` includes the written portions of the project: main, sections, appendices, and project outline tex/pdfs/aux files.
* `misc` contains miscelaneous files.
* `ref` has the bib file for generating the project's references.
* `src` includes the R code developed for the project.
