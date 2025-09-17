## NBN mapping function
# This function creates a map of occurrence records and has the option to plot a density map as well.

occurrenceMap = function(basemap,sppDF,sppName,colGroup = "a",kdePlot = FALSE) {
  # Projection/CRS of base map, NBN Atlas coordinates:
  #     - WGS 84
  plot(st_geometry(basemap),border="#f9fdf9",axes=TRUE,
       xlim=c(-15,5),ylim=c(48.5,61.5),
       col="#d8dedd",cex.axis=0.8)
  
  if(colGroup=="a") {
    pointsCol = "#78C6C0"
  } else {
    pointsCol = "#c6787e"
  }
  points(as.numeric(sppDF$decimalLongitude),
         as.numeric(sppDF$decimalLatitude),
         pch = 19,
         cex = 0.6,
         col=pointsCol)
  
  title(main = sppName,cex.main = 0.9,line = -1)
  
  
  ################ kernel density map #################################
  if (isTRUE(kdePlot)) {
    # Create colour ramp for kernel density estimation of observations
    # using my website colours
    fun_colour_range <- colorRampPalette(c("#d8dedd",pointsCol))   
    my_colours <- fun_colour_range(1000)  
    
    # Setting up the layers to map
    sdf = data.frame(as.numeric(df$decimalLongitude),
                     as.numeric(df$decimalLatitude))
    
    s = SpatialPoints(na.omit(sdf))
    kde.output <- kernelUD(s,h="href", grid = 1000)
    # converts to raster
    kde <- raster(kde.output)
    # sets projection to British National Grid
    projection(kde) <- CRS("+init=EPSG:27700")
    
    masked_kde <- mask(kde, uk_map)
    
    plot(masked_kde,col=my_colours,axes=TRUE,
         xlim=c(-15,5),ylim=c(48.5,61.5))
    plot(st_geometry(uk_map),add = TRUE,border="#f9fdf9")
    title(main = indicatorSpp[a],cex.main = 0.9,line = -1)
  }
}