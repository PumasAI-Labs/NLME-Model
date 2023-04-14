---
title: Pumas-AI NLME Modeling Workshop
description: Workshop template for the introduction to non-linear mixed effects (NLME) modeling in Pumas.
---

[![CC BY-SA 4.0](https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg)](http://creativecommons.org/licenses/by-sa/4.0/)

This workshop is an **introduction to non-linear mixed effects (NLME) modeling in Pumas**.

It covers how to:

- parse data into a `Population`
- define models with `@model` by specifying:
    - parameters with `@param`
    - random effects with `@random`
    - individual coefficients and statistical transformations with `@pre`
    - model dynamics with `@dynamics`
    - error models with `@derived`
- perform estimation with `fit` and accounting for:
    - different estimation methods such as `FOCE` and `LaplaceI`
    - fixed parameters values
- calculate confidence intervals with `infer` by using:
    - variance-covariance matrix
    - bootstrap
    - sampling importance resampling (SIR)

The following Julia files are provided:

1.  `01-population.jl`: covers how to define `Population`s from `DataFrames`
1.  `02-model.jl`: walks throught the `@model` syntax and the model blocks
1.  `03-fit.jl`: overview of different usages of the `fit` function
1.  `04-infer.jl`: overview of different usages of the `infer` function

!!! success "Prerequisites"

    We recommend users being familiar with Julia syntax, especially variables and types.

    The formal requirements are the [Julia Syntax Workshop](https://github.com/PumasAI-Labs/Julia-Syntax) and its pre-requisites.

## Schedule

| Time (HH:MM) | Activity                   | Description                              |
| ------------ | -------------------------- | ---------------------------------------- |
| 00:00        | Setup                      | Download files required for the workshop |
| 00:05        | Parsing Data               | Showcase `01-population.jl`              |
| 00:20        | Model Spefication          | Showcase `02-model.jl`                   |
| 00:35        | Model Fitting              | Showcase `03-fit.jl`                     |
| 00:45        | Model Confidence Intervals | Showcase `04-infer.jl`                   |
| 00:55        | Closing Remarks            | See if there any questions and feedback  |

## Get in touch

If you have any suggestions or want to get in touch with our education team,
please send an email to <training@pumas.ai>.

## Authors

- Jose Storopoli - <jose@pumas.ai>

## License

This content is licensed under [Creative Commons Attribution-ShareAlike 4.0 Internacional](http://creativecommons.org/licenses/by-sa/4.0/).

[![CC BY-SA 4.0](https://licensebuttons.net/l/by-sa/4.0/88x31.png)](http://creativecommons.org/licenses/by-sa/4.0/)
