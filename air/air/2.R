# Load the data
load('air.RData')

# Sort the rows
air <- air |>
  arrange(desc(emissions))

# View(air[1:10, ])

# save
save(air, file = '2.RData')