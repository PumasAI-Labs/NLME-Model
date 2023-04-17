include("02-model.jl")

# Initial parameter values
params = (; tvcl=1.0, tvvc=10.0, Ω=Diagonal([0.09, 0.09]), σ=0.3)

# Fit a the model with FOCE
fit_foce = fit(model, pop, params, FOCE())

# Fit a the model with NaivePooled
fit_naivepooled = fit(model, pop, params, NaivePooled(); omegas=(:Ω,))

# Fit a the model with LaplaceI
fit_laplace = fit(model, pop, params, LaplaceI())

# Fit a the model with FOCE and fixed parameters
fit_foce_fixed = fit(model, pop, params, FOCE(); constantcoef=(; tvcl=1.0))

# Get a NamedTuple of the estimated parameter values
coef(fit_foce)
coef(fit_naivepooled)

# Get a DataFrame of the estimated parameter values
coeftable(fit_foce)
coeftable(fit_naivepooled)

# Get the icoefs from the model fit as a DataFrame
DataFrame(icoef(fit_foce))
