# Caricare le librerie necessarie
library(ggplot2)
library(lubridate)

# Creare un dataset di esempio
data <- data.frame(
  date = seq(as.Date("2025-01-01"), by = "month", length.out = 12),  # Date mensili
  value = c(10, 15, 20, 25, 30, 28, 35, 40, 45, 50, 55, 60)  # Valori corrispondenti
)

# Creare il timechart
timechart <- ggplot(data, aes(x = date, y = value)) +
  geom_line(color = "blue", linewidth = 1) +  # Aggiungere la linea (usando linewidth)
  geom_point(color = "red", size = 2) +  # Aggiungere i punti
  labs(title = "Timechart dei Valori Mensili",
       x = "Data",
       y = "Valore") +
  theme_minimal()  # Tema minimalista

# Salvare il timechart come file PNG
ggsave("timechart.png", plot = timechart, width = 10, height = 6)

# Stampa un messaggio di conferma
cat("Il timechart è stato salvato come timechart.png\n")