---
title: Instructor's Notes for Pumas-AI NLME Modeling Workshop
---

[![CC BY-SA 4.0](https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg)](http://creativecommons.org/licenses/by-sa/4.0/)

Start with the `01-population.jl` file.
Show users how to load `Pumas` with the `using` statement.
Load a NMTRAN-formatted `DataFrame`,
show a preview of the data by going over the column names.
Explain the difference between `evid`s and why some rows have `missing` values
(measurement rows, `evid == 1`).
We suggest using the `iv_sd_3` dataset from `PharmaDatasets.jl`.

Once users are familiar with the NMTRAN format dataset,
introduce the `read_pumas` function to parse NMTRAN-formatted `DataFrame`s into a `Population`.
Go over the `read_pumas`' docstring (`?read_pumas`) with extra attention on the keyword arguments.
The keyword arguments that you should focus are:

- `observations`
- `covariates`
- `id`
- `time`
- `evid`
- `amt`
- `cmt`

If users need to parse complex dosing datasets, e.g. datasets with `II`, `ADDL`, `SS`, `RATE`, or `ROUTE`;
explain the following `read_pumas`'s keyword arguments:

- `ii`
- `addl`
- `ss`
- `rate`
- `route`

Additionally, if users need to deal with datasets that have a missing observation column,
i.e. `MDV` in NMTRAN-formatted datasets;
explain the `mdv` `read_pumas`'s keyword arguments.

Proceed by parsing the NMTRAN-formatted dataset into a `Population`.
Explain that `Population` is simply a collection (`Vector`) of `Subject`s by indexing it and showing the `Subject` result.
Like any Julia `Vector` you can also slice a `Population`.
Show how to slice a `Population` into a subset of the original `Population`.

Showcase how to do the opposite, convert a `Population` or a `Subject` into a NMTRAN-formatted `DataFrame` with the `DataFrame` constructor,
e.g. `DataFrame(pop)`.
Additionally, demonstrate that you can use the `DataFrame` constructor into any of the previous slices and indexes of the original `Population.`

Move to the `02-model.jl`.
Start by explaining the `@model` macro: it allows you to specify model blocks inside it.
With respect of the model blocks, begin with the `@metadata` block and stress the importance of specifying model description and time units.
Explain the `@param` block with a focus on the different domains, e.g. `RealDomain` and `PDiagDomain`.
Don't forget to teach users how to type LaTeX symbols in Julia/Pumas.
Explain the `@random` block with a focus on the probabilistic assignment `~`.
Explain the `@covariates` block and make sure that users understand that the covariates need to be also included in the `read_pumas` function when parsing the data into a `Population`.
Explain the `@pre` block making analogies to NONMEM's `$PK` model block.
Explain the `@dynamics` block by showing examples of both analytical solutions and system of ordinary differential equations,
i.e. `Central1` versus `Central' = -(CL/VC) * Central`.
Explain the `@derived` block with a focus on deterministic `=` and probabilistic `~` assignments,
also for the DVs in this block remark users that they should be included in the `read_pumas` function as values to the `observations` keyword argument.

Proceed to the `03-fit.jl`.
Begin by showing how to define a initial parameter values `NamedTuple`.
Then, highlight that the `fit` function takes four positional arguments:

1. `model`: which model to fit
1. `population`: which population to fit
1. `initial_parameters`: a `NamedTuple` of initial parameter estimates
1. `estimation_method`: which estimation method to use; for maximum likelihood: `FOCE`, `NaivePooled`, and `LaplaceI` are the most common

Perform a fit using `FOCE()`.
Perform a fit using `NaivePooled`.
Don't forget to explain the `omegas` keyword argument when fitting with `NaivePooled`.
Perform a fit using `LaplaceI`.
Perform a fit with fixed parameter values using the `constantcoef` keyword argument.
Show how to get the parameter estimates using `coef` for a `NamedTuple`,
and `coeftable` for a `DataFrame`.
Finally, show how to get a `DataFrame` of the individual subject-specific parameters with `icoef`.

Open `04-infer.jl`.
Showcase how to calculate confidence intervals (CIs) using the `infer` function.
The default case will generate CIs using the variance-covariance matrix calculated using the sandwich estimator.
You can pass an optional second positional argument for alternate ways to generate CIs.
If you pass `Pumas.Bootstrap()` as the second positional argument you will generate CIs using bootstrap,
which by default fits the model to 200 bootstrapped samples.
If you pass `Pumas.SIR()` as the second positional argument you will generate CIs using the sampling importance resamplling (SIR) method.
Warn the user that `Pumas.SIR()` does not have default values,
hence it is necessary to always specify the keyword arguments `samples` and `resamples`.

Finalize the workshop by asking for questions and getting feedback from the users.

## Get in touch

If you have any suggestions or want to get in touch with our education team,
please send an email to <training@pumas.ai>.

## License

This content is licensed under [Creative Commons Attribution-ShareAlike 4.0 Internacional](http://creativecommons.org/licenses/by-sa/4.0/).

[![CC BY-SA 4.0](https://licensebuttons.net/l/by-sa/4.0/88x31.png)](http://creativecommons.org/licenses/by-sa/4.0/)
