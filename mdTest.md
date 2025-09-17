---
output:
  html_document: default
  word_document: default
  pdf_document: default
---
---
title: "Lichen Mapping"
author: "Rosemary Victoria Greensmith"
date: "`r Sys.Date()`"
output: html_document
---

#A

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = FALSE)
# library(devtools)
# devtools::install_github("RGreensmith/NBNAtlasMappingPack")
# library(NBNAtlasMappingPack)

library(dplyr)
library(sf)
library(rnaturalearth)
library(httr)      # for getting data using API's
library(jsonlite)  # for getting NBN Atlas data

# kernel density map
library(sp) # for setting up the layers to map
library(adehabitatHR)
library(raster)

library(showtext)
# library(ggtext)
# Fonts for plots
font_add_google("Montserrat", "mont")
font_add_google("Chivo", "chivo")
showtext_auto()
```
