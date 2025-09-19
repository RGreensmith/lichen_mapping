occurrenceMap = function(basemap,sppDF,colGroup = "a",
                         pointsPlot=TRUE,kdePlot = FALSE,
                         plotTitle) {
  
  if(colGroup=="a") {
    pointsCol = "#78C6C0"
  } else {
    pointsCol = "#c6787e"
  }
  
# Map occurrence as points ------------------------------------------------

  if (isTRUE(pointsPlot)) {
    plot(st_geometry(basemap),border="#f9fdf9",axes=TRUE,
         xlim=c(-15,5),ylim=c(48.5,61.5),
         col="#d8dedd",cex.axis=0.8)
    
    
    points(as.numeric(sppDF$decimalLongitude),
           as.numeric(sppDF$decimalLatitude),
           pch = 19,
           cex = 0.6,
           col=pointsCol)
    
    title(main = plotTitle,cex.main = 0.9,line = -1)
  }

# Map interpolated density of observations --------------------------------
  
  if (isTRUE(kdePlot)) {
    # Create colour ramp for kernel density estimation of observations
    # using my website colours
    fun_colour_range <- colorRampPalette(c("#d8dedd",pointsCol))   
    my_colours <- fun_colour_range(1000)  
    
    # Setting up the layers to map
    sdf = data.frame(as.numeric(sppDF$decimalLongitude),
                     as.numeric(sppDF$decimalLatitude))
    
    s = SpatialPoints(na.omit(sdf))
    kde.output <- kernelUD(s,h="href", grid = 1000)
    
    # converts to raster
    kde <- raster(kde.output)
    
    # sets projection to British National Grid
    projection(kde) <- CRS("+init=EPSG:27700")
    
    masked_kde <- mask(kde, uk_map)
    
    plot(st_geometry(basemap),border="#f9fdf9",axes=TRUE,
         xlim=c(-15,5),ylim=c(48.5,61.5),
         col="#d8dedd",cex.axis=0.8)
    plot(masked_kde,col=my_colours, add = TRUE,)
    plot(st_geometry(uk_map),border="#f9fdf9",add = TRUE)
    

    
    title(main = plotTitle,cex.main = 0.9,line = -1)
  }
}
