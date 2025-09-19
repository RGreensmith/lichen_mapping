
# Preparing data ----------------------------------------------------------
sdf = data.frame(df2$indicatorType,as.numeric(df2$decimalLongitude),
                 as.numeric(df2$decimalLatitude))
s = SpatialPointsDataFrame(data = na.omit(sdf),coords = sdf[,2:3])

# Calculating kernel density ----------------------------------------------
(ud <- kernelUD(s[,1], same4all = TRUE, grid = 100))
image(ud)
# ud = getvolumeUD(ud, standardize = TRUE)

# Calculating difference --------------------------------------------------
udSensitive = raster(ud$nSensitive)
udTolerant = raster(ud$nTolerant)
compareRaster(udSensitive,udTolerant)
rastDiff = udSensitive - udTolerant

# Plot difference ---------------------------------------------------------
plot(rastDiff)

# Plot masked difference --------------------------------------------------
projection(rastDiff) <- CRS("+init=EPSG:27700") # sets projection to British National Grid
maskedDiff = mask(rastDiff, uk_map)
plot(maskedDiff)

fun_colour_range <- colorRampPalette(c("#78C6C0","#d8dedd","#c6787e"))   
my_colours <- fun_colour_range(1000)

plot(st_geometry(uk_map),border="#f9fdf9",axes=TRUE,
     xlim=c(-15,5),ylim=c(48.5,61.5),
     col="#d8dedd",cex.axis=0.8)
plot(maskedDiff,col=my_colours, add = TRUE,)
plot(st_geometry(uk_map),border="#f9fdf9",add = TRUE)
