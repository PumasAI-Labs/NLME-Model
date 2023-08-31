include("01-population.jl")

# Model definition
model = @model begin

  @metadata begin
    desc = "A description of my model."
    timeu = u"hr"
  end

  @param begin
    # here we define the parameters of the model
    tvcl ∈ RealDomain(; lower = 0.001) # typical clearance 
    tvvc ∈ RealDomain(; lower = 0.001) # typical central volume of distribution
    Ω ∈ PDiagDomain(2)                 # between-subject variability
    σ ∈ RealDomain(; lower = 0.001)    # residual variability
  end

  @random begin
    # here we define random effects
    η ~ MvNormal(Ω) # multi-variate Normal with mean 0 and covariance matrix Ω
  end

  @covariates begin
    dosegrp
  end

  @pre begin
    # pre computations and other statistical transformations
    CL = tvcl * exp(η[1])
    Vc = tvvc * exp(η[2])
  end

  # here we define compartments and dynamics
  @dynamics begin
    Central' = -CL / Vc * Central
  end

  @derived begin
    # here is where we calculate concentration and add residual error
    # tilde (~) means "distributed as"
    cp = @. 1000 * Central / Vc # Change of units
    dv ~ @. Normal(cp, cp * σ)
  end
end
