library(dplyr)

# download and extract patterns to ~/Downloads from ...
# https://kth-my.sharepoint.com/:u:/g/personal/malinmod_ug_kth_se/EdhM8UI5s6pDotMBp5T1SRMB2O5LHXKK8kIWtLaw08ob-Q?e=gakDjp

patternz <- 
  tibble(fn = dir("~/Downloads/Digital/", recursive = T, full.names = T)) |> 
    filter(!grepl("\\.eps", fn)) |> 
    mutate(format = stringr::str_extract(fn, ".*//(.*?)/(.*)?/.*$", 1)) |> 
    mutate(two = stringr::str_extract(fn, ".*//(.*?)/(.*)?/.*$", 2)) |> 
    mutate(three = stringr::str_extract(fn, "_(.*?)_", 1)) |> 
    mutate(orientation = stringr::str_extract(fn, "format_(.*?)\\.", 1)) |> 
    select(c(2:5, 1)) |> 
    mutate(aspect = case_when(
      format == "16x9" ~ "wide",
      format == "9x16" ~ "long",
      format == "1x1" ~ "square", 
      format == "A-format" & orientation == "liggande" ~ "landscape",
      format == "A-format" & orientation == "staende" ~ "portrait",
      .default = as.character(format))) |> 
    mutate(color = case_when(
      three == "digitalbla" ~ "digital",
      three == "himmelsbla" ~ "cyan",
      three == "KTH-bla" ~ "blue",
      three == "ljusbla" ~ "lightblue",
      three == "marinbla" ~ "darkblue",
      three == "sand" ~ "sand",
      three == "vit" ~ "white",
      .default = as.character(three))
    ) |> 
  filter(two %in% c("png")) |> 
  select(color, aspect, two, fn) |> 
  mutate(fn_new = glue::glue("{color}_{aspect}.{two}")) |> 
  mutate(dest = paste0(normalizePath("~/repos/kth-quarto/_extensions/kth-quarto/img"), "/pattern_", fn_new))

resave <- function(fn, dest) file.copy(from = fn, to = dest)

purrr::walk2(patternz$fn, patternz$dest, resave)

