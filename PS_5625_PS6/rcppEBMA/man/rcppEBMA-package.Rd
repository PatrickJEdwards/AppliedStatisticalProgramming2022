\name{rcppEBMA-package}
\alias{rcppEBMA-package}
\alias{rcppEBMA}
\docType{package}
\title{
  Perform the Expectation-Maximization Algorithm
}
\description{
  This package implements an 'ensemble of models'.  It calculates the probability that observation `t` is best predictedby model `k`, then estimates the weights assigned to each model. It repeats this until a provided threshold is reached.
}
\details{
  Includes three major functions:
    `CPP_EBMA.cpp`: Performs iteration. Repeats the steps outlined in the `description` section above until the threshold is reached.
    `W_H.cpp`: calculates the new weights from the latent factors representing probabilities.
    `Z_H.cpp`: calculates the latent factors that represent probabilities.
}
\author{
Patrick Edwards

Maintainer: Patrick Edwards edwardspatrick94@gmail.com
}
\references{
Montgomery, Jacob M., Florian M. Hollenbach, and Michael D. Ward. "Ensemble predictions of the 2012 US presidential election." PS: Political Science & Politics 45, no. 4 (2012): 651-654.
}
\keyword{ package }
