---
title: Reference Sheets for Pumas-AI NLME Modeling Workshop
---

[![CC BY-SA 4.0](https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg)](http://creativecommons.org/licenses/by-sa/4.0/)

## Key Points

- You can parse a NM-TRAN-formatted `DataFrame` into a `Population` with `read_pumas`
- A `Population` is just a collection (`Vector`) of `Subject`s
- You can slice and index `Population`s to get another `Population` subset or a single `Subject`
- You can reconstruct a NM-TRAN-formatted `DataFrame` from a `Population`/`Subject` with the `DataFrame` constructor

## Summary of Basic Commands

| Action                                              | Command                                       | Observations                   |
| --------------------------------------------------- | --------------------------------------------- | ------------------------------ |
| Parse data into a `Population`                      | `read_pumas`                                  | NM-TRAN-formatted `DataFrame`s |
| Index or slice a `Population`                       | `pop[1]` or `pop[1:10]`                       |                                |
| Reconstruct data from a `Population`                | `DataFrame(pop)`                              | NM-TRAN-formatted `DataFrame`s |
| Reconstruct data from a index or slice `Population` | `DataFrame(pop[1])` or `DataFrame(pop[1:10])` | NM-TRAN-formatted `DataFrame`s |

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

## Get in touch

If you have any suggestions or want to get in touch with our education team,
please send an email to <training@pumas.ai>.

## License

This content is licensed under [Creative Commons Attribution-ShareAlike 4.0 Internacional](http://creativecommons.org/licenses/by-sa/4.0/).

[![CC BY-SA 4.0](https://licensebuttons.net/l/by-sa/4.0/88x31.png)](http://creativecommons.org/licenses/by-sa/4.0/)
