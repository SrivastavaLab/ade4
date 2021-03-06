\name{within}
\alias{print.within}
\alias{summary.within}
\alias{plot.within}
\alias{plot.witcoi}
\alias{print.witcoi}
\title{Within-Class Analysis}
\description{
Outputs and graphical representations of the results of a within-class analysis.
}
\usage{
\method{plot}{within}(x, xax = 1, yax = 2, \dots) 
\method{print}{within}(x, \dots)
\method{plot}{witcoi}(x, xax = 1, yax = 2, \dots)
\method{print}{witcoi}(x, \dots)
\method{summary}{within}(object, \dots)
}
\arguments{
  \item{x,object}{an object of class \code{within} or \code{witcoi}}
  \item{xax}{the column index for the x-axis}
  \item{yax}{the column index for the y-axis}
  \item{\dots}{further arguments passed to or from other methods}
}

\references{
Benzécri, J. P. (1983) Analyse de l'inertie intra-classe par l'analyse d'un tableau de correspondances. \emph{Les Cahiers de l'Analyse des données}, \bold{8}, 351--358.\cr\cr
Dolédec, S. and Chessel, D. (1987) Rythmes saisonniers et composantes stationnelles en milieu aquatique I- Description d'un plan d'observations complet par projection de variables. \emph{Acta Oecologica, Oecologia Generalis}, \bold{8}, 3, 403--426.
}
\author{
Daniel Chessel \cr
Anne-Béatrice Dufour \email{anne-beatrice.dufour@univ-lyon1.fr}\cr
Stéphane Dray \email{stephane.dray@univ-lyon1.fr}
}
\seealso{\code{\link{wca.dudi}}, \code{\link{wca.coinertia}}}
\examples{
data(meaudret)
pca1 <- dudi.pca(meaudret$env, scan = FALSE, nf = 4)
wit1 <- wca(pca1, meaudret$design$site, scan = FALSE, nf = 2)

if(adegraphicsLoaded()) {
  g1 <- s.traject(pca1$li, meaudret$design$site, psub.text = "Principal Component Analysis", 
    plines.lty = 1:length(levels(meaudret$design$site)), plot = F)
  g2 <- s.traject(wit1$li, meaudret$design$site, psub.text = 
    "Within site Principal Component Analysis", 
    plines.lty = 1:length(levels(meaudret$design$site)), plot = F)
  g3 <- s.corcircle (wit1$as, plot = F)
  G <- ADEgS(list(g1, g2, g3), layout = c(2, 2))
  
} else {
  par(mfrow = c(2, 2))
  s.traject(pca1$li, meaudret$design$site, sub = "Principal Component Analysis", csub = 1.5)
  s.traject(wit1$li, meaudret$design$site, sub = "Within site Principal Component Analysis", 
    csub = 1.5)
  s.corcircle (wit1$as)
  par(mfrow = c(1, 1))
}

plot(wit1)
}
\keyword{multivariate}
