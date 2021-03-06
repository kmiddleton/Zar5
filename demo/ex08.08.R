Weight <- ex08.08$Weight
Height <- ex08.08$Height

(n.W <- length(Weight))
(df.W <- n.W - 1)
(mean.W <- mean(Weight)) 
(SS.W <- sum((Weight - mean.W)^2))
(s2.W <- var(Weight))
(s.W <- sd(Weight))
(V.W <- s.W / mean.W)
log.W <- log10(Weight)
(SS.log.W <- sum((log.W - mean(log.W))^2))
(var.log.W <- var(log.W))

(n.H <- length(Height))
(df.H <- n.H - 1)
(mean.H <- mean(Height)) 
(SS.H <- sum((Height - mean.H)^2))
(s2.H <- var(Height))
(s.H <- sd(Height))
(V.H <- s.H / mean.H)
log.H <- log10(Height)
(SS.log.H <- sum((log.H - mean(log.H))^2))
(var.log.H <- var(log.H))

# Variance-ratio test
(F <- var.log.W / var.log.H)
2 * pf(F, df1 = df.W, df2 = df.H, lower.tail = FALSE)

# Z test
(V.p <- (df.W * V.W + df.H * V.H) / (df.W + df.H))
(V.p2 <- V.p^2)
(Z <- (V.W - V.H) / sqrt((V.p2 / df.W + V.p2 / df.H) * (0.5 + V.p2)))
2 * pnorm(abs(Z), lower.tail = FALSE)

# Using CV.test
CV.test(Weight, Height, test = "F")
CV.test(Weight, Height, test = "Z")
