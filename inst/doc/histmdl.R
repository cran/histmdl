### R code from vignette source 'histmdl.Rnw'

###################################################
### code chunk number 1: histmdl.Rnw:58-61
###################################################
options (prompt="R> ", continue="+ ", width=70, useFancyQuotes=FALSE)
library (histmdl)
set.seed (28011988)


###################################################
### code chunk number 2: histmdl.Rnw:80-82
###################################################
x1 <- c (rnorm (1000, -6), rnorm (1000, 6))
x2 <- c (runif (50), runif (50, max=3))


###################################################
### code chunk number 3: histmdl.Rnw:89-93
###################################################
par (mar=c (4, 4, 0, 0) + 0.2)
x1x <- seq (-10, 10, length=2000)
hist (x1, freq=FALSE, ylim=c (0, .225), main='')
lines (x1x, (dnorm (x1x, -6) + dnorm (x1x, 6)) / 2, lty=2)


###################################################
### code chunk number 4: histmdl.Rnw:98-101
###################################################
par (mar=c (4, 4, 2, 0) + 0.2)
hist (x2, freq=FALSE, main='')
lines (c (0, 1, 1, 3), c (2/3, 2/3, 1/6, 1/6), lty=2)


###################################################
### code chunk number 5: histmdl.Rnw:276-279 (eval = FALSE)
###################################################
## library (histmdl)
## histmdl (x1, gain=2)
## histmdl (x2)


###################################################
### code chunk number 6: histmdl.Rnw:284-288
###################################################
par (mar=c (4, 4, 0, 0) + 0.2)
histmdl (x1, gain=2, xlim=c(-10, 10), ylim=c (0, .225), main='', col='lightblue')
hist (x1, freq=FALSE, add=TRUE)
lines (x1x, (dnorm (x1x, -6) + dnorm (x1x, 6)) / 2, lty=2)


###################################################
### code chunk number 7: histmdl.Rnw:293-297
###################################################
par (mar=c (4, 4, 2, 0) + 0.2)
histmdl (x2, xlim=c (0, 3), main='', col='lightblue')
hist (x2, freq=FALSE, add=TRUE)
lines (c (0, 1, 1, 3), c (2/3, 2/3, 1/6, 1/6), lty=2)


###################################################
### code chunk number 8: histmdl.Rnw:322-324 (eval = FALSE)
###################################################
## histmdl (round (60 * faithful$eruptions))
## hist (round (60 * faithful$eruptions))


###################################################
### code chunk number 9: histmdl.Rnw:328-330
###################################################
histmdl (round (60 * faithful$eruptions), xlim=c (80, 320), main='', col='lightblue')
hist (round (60 * faithful$eruptions), freq=FALSE, add=TRUE)


