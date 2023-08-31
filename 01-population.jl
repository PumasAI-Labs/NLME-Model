using Pumas
using PharmaDatasets

# IV Single Dose Data
pkdata = dataset("iv_sd_3")

# check that we have the standard NM-TRAN column names such as
# - id
# - time
# - dv
# - amt
# - evid
# - cmt
# - rate
# We also have a covariate dosegrp

# The function that parses data into a Population is read_pumas
# Check the docstring with ?read_pumas in your Julia REPL
# Specifically, the keyword arguments

#?read_pumas

# Now let's read our DataFrame into a Population with read_pumas
pop = read_pumas(
  pkdata;
  observations = [:dv], # this is a vector of column names
  covariates = [:dosegrp], # this is a vector of column names
  id = :id,
  time = :time,
  amt = :amt,
  evid = :evid,
  cmt = :cmt,
  rate = :rate,
)

# A Population is simply a vector of Subjects
pop[1]

# You can also slice it same as with any vector
pop[5:10]
pop[begin:30]
pop[80:end]

# We can also convert back to a NM-TRAN DataFrame by using the DataFrame constructor
reconstructed_pkdata = DataFrame(pop)

# Or a single Subject of the Population
reconstructed_subject = DataFrame(pop[1])
