# author: Alexander C. Hungerford

# created: 5 December 2016

# title:
    # Datacamp
    # Data Manipulation in R with Dplyr
    # Section 1 - tidying data


# envSetup ----------------------------------------------------------------

# set up the envirnoment
# install.packages("dplyr")
# install.packages("hflights")

library("dplyr")
library("hflights")


# load, View Data ---------------------------------------------------------

# read in data
hflights <- hflights

# Look at the data
str(hflights)
hflights[1:20,]


# df to tibble ------------------------------------------------------------

# create hflights tibble
hflights_tbl <- tbl_df(hflights)

# tibbles are a special dataframe that shows you only what fits in your
# console and adjusts with the size of your window
hflights_tbl

# the tibble is multiple classes
class(hflights_tbl)


# lookup table ------------------------------------------------------------

# create Carriers vector
carriers <- hflights$UniqueCarrier
# notice it is a "character" class
class(carriers)

## changing labels of hflights; named vector as lookup table
lut <- c("AA" = "American", "AS" = "Alaska", "B6" = "JetBlue",
         "CO" = "Continental", "DL" = "Delta", "OO" = "SkyWest",
         "UA" = "United", "US" = "US_Airways", "WN" = "Southwest",
         "EV" = "Atlantic_Southeast", "F9" = "Frontier",
         "FL" = "AirTran", "MQ" = "American_Eagle",
         "XE" = "ExpressJet", "YV" = "Mesa")

class(lut)

# add a Carrier column to hflights_tbl
hflights_tbl$Carrier <- lut[hflights$UniqueCarrier]

# we went straight down the UniqueCarrier column and we replaced
# the codes -- AA, AS, DL, UA etc. -- with the corresponding names from lut,
# our lookup table; American, Alaska, Delta, United etc.

# now you'll see the Carrier variable, looking at variables 19, 20, 21, 22
str(hflights_tbl[19:22])


# lut2 fails --------------------------------------------------------------

# lookup table for cancellation codes
lut2 <- c("A" = "carrier", "B" = "weather", "C" = "FFA",
          "D" = "security", "E" = "not cancelled")

# add a Code column, replacing CancellationCodes -- fails, why?
hflights_tbl$Code <- lut2[hflights_tbl$CancellationCode]

# see column Code
str(hflights_tbl[19:23])
glimpse(hflights_tbl)


# tbl back to df ----------------------------------------------------------

# from hflights package, call data hflights, and assign back to hflights
hflights <- hflights::hflights
str(hflights)




# Section 2: Select & Mutate ----------------------------------------------

# select() will remove rows, returning only the ones we've chosen
    # contains("x")
    # matches("x")
    # ends_with("xyz")
    # starts_with("abc")



# NOTES -------------------------------------------------------------------
# 
# select(), which returns a subset of the columns,
# filter(), that is able to return a subset of the rows,
# arrange(), that reorders the rows according to single or multiple variables,
# mutate(), used to add columns from existing data,
# summarize(), which reduces each group to a single row by calculating aggregate measures.
