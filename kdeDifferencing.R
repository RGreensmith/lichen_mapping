
# Preparing data ----------------------------------------------------------
sdf = data.frame(df2$indicatorType,as.numeric(df2$decimalLongitude),
                 as.numeric(df2$decimalLatitude))
s = SpatialPointsDataFrame(data = na.omit(sdf),coords = sdf[,2:3])

# Calculating kernel density ----------------------------------------------
(ud <- kernelUD(s[,1], same4all = TRUE, grid = 1000))
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

op = par(font.lab = 2,
         mar=c(2,9,1,9)+0.1
         ,xpd=FALSE, family = "lil")
fun_colour_range <- colorRampPalette(c("#c6787e","#d8dedd","#78C6C0"))   
my_colours <- fun_colour_range(100)

plot(st_geometry(uk_map),border="#f9fdf9",axes=TRUE,
     xlim=c(-15,5),ylim=c(48.5,61.5),
     col="#d8dedd",cex.axis=0.8)
plot(maskedDiff,col=my_colours, add = TRUE,)
plot(st_geometry(uk_map),border="#f9fdf9",add = TRUE)
title(main = "Difference in lichen indicator spp. occurrence",family = "lil",cex.main = 1.5,line = -1)
