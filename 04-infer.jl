include("03-fit.jl")

# Confidence intervals using the variance-covariance matrix
infer_cis = infer(fit_foce)

# Confidence intervals using bootstrap
infer_cis_bs = infer(fit_foce, Pumas.Bootstrap())

# Confidence intervals using sampling importance resampling (SIR)
infer_cis_sir = infer(fit_foce, Pumas.SIR(; samples = 100, resamples = 10))

# Any result from infer can be converted to a DataFrame with coeftable
coeftable(infer_cis)
coeftable(infer_cis_bs)
