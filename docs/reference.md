---
title: Reference Sheets for Pumas-AI NLME Modeling Workshop
---

[![CC BY-SA 4.0](https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg)](http://creativecommons.org/licenses/by-sa/4.0/)

## Key Points

- You can parse a NM-TRAN-formatted `DataFrame` into a `Population` with `read_pumas`
- A `Population` is just a collection (`Vector`) of `Subject`s
- You can slice and index `Population`s to get another `Population` subset or a single `Subject`
- You can reconstruct a NM-TRAN-formatted `DataFrame` from a `Population`/`Subject` with the `DataFrame` constructor
- To define a model in Pumas, you use the `@model` macro along with the model blocks:
  - `@metadata` for model metadata such as description and time units
  - `@param` for the population parameters (i.e. typical values or fixed effects)
  - `@random` for the subject-specific parameters (η or random effects)
  - `@covariates` for subject covariates
  - `@pre` for pre computations such as individual coefficients or any other statistical transformation
  - `@dynamics` for the model dynamics, either as an analytical solution or a system of ordinary differential equations
  - `@derived` for derived variables and error model
- In the `@model` you can have two types of assignments:
  - Deterministic assignments with `=`
  - Probabilistic assignments with `~`
- The `fit` function is very flexible, it has 4 positional arguments:
  1. `model`: which model to fit
  1. `population`: which population to fit
  1. `initial_parameters`: a `NamedTuple` of initial parameter estimates
  1. `estimation_method`: which estimation method to use; for maximum likelihood: `FOCE`, `NaivePooled`, and `LaplaceI` are the most common
- Additionally, the `fit` function has the following most used keyword arguments:
  - `constantcoef`: if you want to set any parameter value to a constant value, similar to `FIX` in NONMEM
  - `omegas`: a tuple with the value of the "omegas" in the `@param` block, needed for `NaivePooled` estimation method
- All results from the `fit` function can be converted to a:
  - `NamedTuple` with `coef`
  - `DataFrame` with `coeftable`
- You can extract individual coefficients with the `icoef` function, if you want in a `DataFrame` format use the `DataFrame` constructor on the result

## Summary of Basic Commands

| Action                                                                            | Command                                                                                | Observations                                                                                                                      |
| --------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| Parse data into a `Population`                                                    | `read_pumas`                                                                           | NM-TRAN-formatted `DataFrame`s                                                                                                    |
| Index or slice a `Population`                                                     | `pop[1]` or `pop[1:10]`                                                                |                                                                                                                                   |
| Reconstruct data from a `Population`                                              | `DataFrame(pop)`                                                                       | NM-TRAN-formatted `DataFrame`s                                                                                                    |
| Reconstruct data from a index or slice `Population`                               | `DataFrame(pop[1])` or `DataFrame(pop[1:10])`                                          | NM-TRAN-formatted `DataFrame`s                                                                                                    |
| Define a model                                                                    | `@model`                                                                               |
| Define model metadata                                                             | `@metadata`                                                                            |
| Define the population parameters of a model                                       | `@param`                                                                               |
| Define the subject-specific parameters of a model                                 | `@random`                                                                              |
| Define the subject covariates                                                     | `@covariates`                                                                          |
| Define individual coefficients, precomputations or any statistical transformation | `@pre`                                                                                 |
| Define model dynamics                                                             | `@dynamics`                                                                            |
| Define model derived variables and error model                                    | `@derived`                                                                             |
| Fit a model using `FOCE()`                                                        | `fit(model, population, initial_parameters, FOCE())`                                   | `initial_parameters` is a `NamedTuple` of parameter name and values                                                               |
| Fit a model using `NaivePooled`                                                   | `fit(model, population, initial_parameters, NaivePooled(); omegas=(:Ω,))`              | `omegas` is a keyword argument that should be a tuple specifying the variable name where the Ωs are defined in the model          |
| Fit a model using `FOCE()` with fixed parameter values                            | `fit(model, population, initial_parameters, FOCE(); constantcoef=(; parameter=value))` | `constantcoef` is a keyword argument that should be a `NamedTuple` specifying the parameter name along with the value to be fixed |
| Get model fit coefficients as a `NamedTuple`                                      | `coef(fit_result)`                                                                     |
| Get model fit coefficients as a `DataFrame`                                       | `coeftable(fit_result)`                                                                |
| Get model individual parameters as a `DataFrame`                                  | `DataFrame(icoef(fit_result))`                                                         |

## Glossary

NM-TRAN

: Official NONMEM dataset format.
Check [Pumas documentation on Data Representation](https://docs.pumas.ai/stable/basics/data_representation) for more information.

`DataFrame`

: A tabular data format from the package [`DataFrames.jl`](https://dataframes.juliadata.org).
It is the standard tabular data format in Julia and is present in the Pumas app.

`Population`

: Pumas' representation of a collection of `Subject`s.
Generally parsed from NM-TRAN-formatted `DataFrame`s.

`Vector`

: Contiguous data structure that allows ordering, indexing, looping, slicing,
and shape-destructing operations,
i.e. grow or shrink.
Most used to group elements into a collection.

`Subject`

: Pumas' representation of a subject that has covariates, time, events, observations,
and any other relevant information.

`@model`

: how users define models in Pumas, it allows for several other blocks inside.
The syntax is similar to NONMEM model specification,
but with higher flexibility and expressiveness.

`@metadata`

: `@model` block with additional details such as model description and model time units.

`@param`

: `@model` block for the population parameters.
Analogous to NONMEM's `$THETA`, `$OMEGA`, and `$SIGMA`.

`@random`

: `@model` block for the subject-specific parameters, also known as η or random effects.

`@covariates`

: `@model` block for subject covariates.

`@pre`

: `@model` block for pre computations such as individual coefficients or any other statistical transformation.
Analogous to NONMEM's `$PK`.

`@dynamics`
: `@model` block for the model dynamics, either as an analytical solution or a system of ordinary differential equations.
Analogous to NONMEM's `$DES`.

`@derived`

: `@model` block for derived variables and error model.
Analogous to NONMEM's `$ERROR`.

Deterministic assignments

: assignments that will always return the same value.
The standard assignment operator in programming languages,
e.g. `x=1` or `y="hello"`.

Probabilistic assignments

: An assignment operator that instead of returning the same value,
samples a random value under a distribution.
For example, `x ~ Normal(0, 1)` will generate a new value sampled from a normal distribution with mean 0 and standard deviation 1
every time it is executed.

Model

: Mathematical representation of the underlying process regarding a certain phenomena.

Fit

: Condition the data into the model and infer the model's parameter values by an estimation method.

FOCE

: Estimation method originally from NONMEM, it means **F**irst **O**rder **C**onditional **E**ffects.
Please refer to the [Pumas documentation](htts://docs.pumas.ai) for more details.

Naive Pooled

: Estimation method that ignores subject-specific parameters relying only on population parameters.
Please refer to the [Pumas documentation](htts://docs.pumas.ai) for more details.

Laplace

: Estimation method that uses Laplacian approximation under the hood.
Please refer to the [Pumas documentation](htts://docs.pumas.ai) for more details.

Ω

: The covariance matrix of the subject-specific parameters.
Commonly referred as the "Omega" matrix.

η

: The individual subject-specific parameters.
Commonly referred as "etas".
Generally a vector for each subject, e.g. `η = [η₁, η₂]`.

`icoef`

: Individual coefficients, also known as subject-specific parameters.

## Get in touch

If you have any suggestions or want to get in touch with our education team,
please send an email to <training@pumas.ai>.

## License

This content is licensed under [Creative Commons Attribution-ShareAlike 4.0 Internacional](http://creativecommons.org/licenses/by-sa/4.0/).

[![CC BY-SA 4.0](https://licensebuttons.net/l/by-sa/4.0/88x31.png)](http://creativecommons.org/licenses/by-sa/4.0/)
