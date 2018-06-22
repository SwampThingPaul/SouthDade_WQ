---
title: "South Dade Conveyance System Environmental Information"
author: "Point of Contact: Paul Julian (<paul.julian@dep.state.fl.us>)" 
output: 
  html_document: 
    keep_md: yes
---





**_Please note this analysis is for informational purposes only and subject to change._** 



# Hydrologic Information

Provided in this section are peroid of record (POR) discharge data and associated metrics of avialable data in the South Florida Water Management Districts [DBHYDRO](http://my.sfwmd.gov/dbhydroplsql/show_dbkey_info.main_menu). All structure DBKEYs used to construct these discharge time-series can be found in this [file](http://publicfiles.dep.state.fl.us/owp/SouthDade_Info/DataInventory_existing.xlsx).



<!--html_preserve--><div id="htmlwidget-62c495c76478604f60bf" style="width:100%;height:432px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-62c495c76478604f60bf">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"setView":[[25.46,-80.55],10,[]],"calls":[{"method":"addProviderTiles","args":["Esri.WorldImagery",null,null,{"errorTileUrl":"","noWrap":false,"zIndex":null,"unloadInvisibleTiles":null,"updateWhenIdle":null,"detectRetina":false,"reuseTiles":false}]},{"method":"addProviderTiles","args":["OpenStreetMap",null,null,{"errorTileUrl":"","noWrap":false,"zIndex":null,"unloadInvisibleTiles":null,"updateWhenIdle":null,"detectRetina":false,"reuseTiles":false,"opacity":0.4}]},{"method":"addMarkers","args":[[25.6111,25.6114,25.60718,25.549533,25.515128,25.48352,25.482966,25.483157,25.482663,25.463284,25.421891,25.417762,25.418426,25.44412,25.402754,25.403209,25.4082,25.330631,25.287304],[-80.5093,-80.5097,-80.524492,-80.560579,-80.560194,-80.56377,-80.563778,-80.571077,-80.562796,-80.573666,-80.590195,-80.573793,-80.573762,-80.560311,-80.558343,-80.559039,-80.52398,-80.524997,-80.441821],null,null,null,{"clickable":true,"draggable":false,"keyboard":true,"title":"","alt":"","zIndexOffset":0,"opacity":1,"riseOnHover":false,"riseOffset":250},["Structure: S331<BR> Inflow Area:L31N","Structure: S173<BR> Inflow Area:L31N","Structure: S357<BR> Inflow Area:8.5 SMA","Structure: S332B<BR> Inflow Area:B-Detention","Structure: S332C<BR> Inflow Area:C-Detention","Structure: S174<BR> Inflow Area:L31W","Structure: S332D<BR> Inflow Area:D-Detention","Structure: S332DX1<BR> Inflow Area:L31W","Structure: S176<BR> Inflow Area:L31N","Structure: S328<BR> Inflow Area:L31W","Structure: S332<BR> Inflow Area:L31W","Structure: S175<BR> Inflow Area:L31W","Structure: G737<BR> Inflow Area:L31W","Structure: S200<BR> Inflow Area:Frog Pond","Structure: S177<BR> Inflow Area:C111","Structure: S199<BR> Inflow Area:C111/Aerojet","Structure: S178<BR> Inflow Area:C111E","Structure: S18C<BR> Inflow Area:C111","Structure: S197<BR> Inflow Area:C111"],null,null,null,["S331","S173","S357","S332B","S332C","S174","S332D","S332DX1","S176","S328","S332","S175","G737","S200","S177","S199","S178","S18C","S197"],{"clickable":false,"noHide":true,"direction":"right","opacity":1,"offset":[12,-15],"textsize":"10px","textOnly":false,"style":null,"zoomAnimation":true,"className":""},null]},{"method":"addMiniMap","args":[null,null,"bottomleft",150,150,19,19,-5,false,false,false,true,false,false,{"color":"#ff7800","weight":1,"clickable":false},{"color":"#000000","weight":1,"clickable":false,"opacity":0,"fillOpacity":0},{"hideText":"Hide MiniMap","showText":"Show MiniMap"},[]]}],"limits":{"lat":[25.287304,25.6114],"lng":[-80.590195,-80.441821]}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->



<center> Interactive map of structures monitored within the South Dade Conveyance System. Currently no data is availabel for S328 (D-Detention Area) or G737 (Frog Pond Detention Area).</center>

<br>
<br>
Below are a series of plots for each structure with accessible/available data. Only positive flows were used in this analysis. Reverse flow has been observed at some strucutres. The three plots are flow-duration curves using daily data for the entire POR for any given structure (left), daily discharge volume (middle) and total discahrge volume based on the Florida Water Year (right). The lower flow-duration limit (20% Exceedance) for each strcture has been identified where applicable. All hydrologic data is presented in m^3^ d^-1^ or m^3^ WY^-1^, to convert from m^3^ to Acre-Feet, multiply values by 0.000810714. 

<br>
<br>

# {.tabset .tabset-fade}
## S331
<img src="SouthDade_summary_files/figure-html/HydroPlots1-1.png" style="display: block; margin: auto;" />
<br>
Daily Discharge Data Summary for the Period of Record (Units:m^3^ d^-1^)

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##       0       0       0  502005  947903 3387241
```

Daily Discharge Data Summary for the last 10-WYs (May 2005 - Apirl 2016; Units:m^3^ d^-1^)

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##       0       0   69189  601338 1069272 2993122
```

Water Year Discharge Data Summary for the Period of Record (Units:m^3^ WY^-1^)

```
##      Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
##   3247248 110676392 194768234 180323195 259369218 327449753
```

Water Year Discharge Data Summary for the last 10-WYs (2006-2016; Units:m^3^ d^-1^)

```
##      Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
##  50562343 153779872 259628183 219652473 289775981 327449753
```
<br>

## S173
<img src="SouthDade_summary_files/figure-html/HydroPlots2-1.png" style="display: block; margin: auto;" />
<br>
Daily Discharge Data Summary for the Period of Record (Units:m^3^ d^-1^)

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##       0       0   86915  139854  276201  779285
```

Daily Discharge Data Summary for the last 10-WYs (May 2005 - Apirl 2016; Units:m^3^ d^-1^)

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##       0       0       0   72092  145694  652454
```

Water Year Discharge Data Summary for the Period of Record (Units:m^3^ WY^-1^)

```
##      Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
##         0  25085201  43217478  51083468  84540073 115510577
```

Water Year Discharge Data Summary for the last 10-WYs (2006-2016; Units:m^3^ d^-1^)

```
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
##  8378656 21754794 25719648 26333174 33344451 45463573
```
<br>

## S357
<img src="SouthDade_summary_files/figure-html/HydroPlots3-1.png" style="display: block; margin: auto;" />
<br>
Daily Discharge Data Summary for the Period of Record (Units:m^3^ d^-1^)

```
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
##      0.0      0.0      0.0  46135.2    293.6 938654.9
```

Daily Discharge Data Summary for the last 10-WYs (May 2005 - Apirl 2016; Units:m^3^ d^-1^)

```
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
##      0.0      0.0      0.0  46135.2    293.6 938654.9
```

Water Year Discharge Data Summary for the Period of Record (Units:m^3^ WY^-1^)

```
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
##   256255  2159290  6064790 14849774 22306822 46919337
```

Water Year Discharge Data Summary for the last 10-WYs (2006-2016; Units:m^3^ d^-1^)

```
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
##   256255  2159290  6064790 14849774 22306822 46919337
```
<br>

## S332B
<img src="SouthDade_summary_files/figure-html/HydroPlots4-1.png" style="display: block; margin: auto;" />
<br>
Daily Discharge Data Summary for the Period of Record (Units:m^3^ d^-1^)

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##       0       0       0  111823       0 1557958
```

Daily Discharge Data Summary for the last 10-WYs (May 2005 - Apirl 2016; Units:m^3^ d^-1^)

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##       0       0       0  271653  519629 1557958
```

Water Year Discharge Data Summary for the Period of Record (Units:m^3^ WY^-1^)

```
##      Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
##         0         0         0  40844691  62207391 255296464
```

Water Year Discharge Data Summary for the last 10-WYs (2006-2016; Units:m^3^ d^-1^)

```
##      Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
##         0   7781360  79956167  99227595 194195587 255296464
```
<br>

## S332C
<img src="SouthDade_summary_files/figure-html/HydroPlots5-1.png" style="display: block; margin: auto;" />
<br>
Daily Discharge Data Summary for the Period of Record (Units:m^3^ d^-1^)

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##       0       0       0   45711       0 1557982
```

Daily Discharge Data Summary for the last 10-WYs (May 2005 - Apirl 2016; Units:m^3^ d^-1^)

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##       0       0       0   45711       0 1557982
```

Water Year Discharge Data Summary for the Period of Record (Units:m^3^ WY^-1^)

```
##      Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
##         0         0         0  15189709         0 144230564
```

Water Year Discharge Data Summary for the last 10-WYs (2006-2016; Units:m^3^ d^-1^)

```
##      Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
##         0         0         0  15189709         0 144230564
```
<br>
## S174
<img src="SouthDade_summary_files/figure-html/HydroPlots6-1.png" style="display: block; margin: auto;" />
<br>
Daily Discharge Data Summary for the Period of Record (Units:m^3^ d^-1^)

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##       0       0       0  123560  195604 1123249
```

Water Year Discharge Data Summary for the Period of Record (Units:m^3^ WY^-1^)

```
##      Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
##         0         0  10999065  44440387 104653438 171300504
```
<br>

## S332DX1

```
## Warning in max(fdc.dat.da$PerExceed): no non-missing arguments to max;
## returning -Inf

## Warning in max(fdc.dat.da$PerExceed): no non-missing arguments to max;
## returning -Inf

## Warning in max(fdc.dat.da$PerExceed): no non-missing arguments to max;
## returning -Inf

## Warning in max(fdc.dat.da$PerExceed): no non-missing arguments to max;
## returning -Inf
```

<img src="SouthDade_summary_files/figure-html/HydroPlots7-1.png" style="display: block; margin: auto;" />
<br>
Daily Discharge Data Summary for the Period of Record (Units:m^3^ d^-1^)

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##       0       0       0       0       0       0
```

Daily Discharge Data Summary for the last 10-WYs (May 2005 - Apirl 2016; Units:m^3^ d^-1^)

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##       0       0       0       0       0       0
```

Water Year Discharge Data Summary for the Period of Record (Units:m^3^ WY^-1^)

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##       0       0       0       0       0       0
```

Water Year Discharge Data Summary for the last 10-WYs (2006-2016; Units:m^3^ d^-1^)

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##       0       0       0       0       0       0
```
<br>

## S332D
<img src="SouthDade_summary_files/figure-html/HydroPlots8-1.png" style="display: block; margin: auto;" />
<br>
Daily Discharge Data Summary for the Period of Record (Units:m^3^ d^-1^)

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##       0       0       0  296832  573588 1398392
```

Water Year Discharge Data Summary for the Period of Record (Units:m^3^ WY^-1^)

```
##      Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
##         0  55565967 111306815 106824644 157888181 223503622
```
<br>

## S176
<img src="SouthDade_summary_files/figure-html/HydroPlots9-1.png" style="display: block; margin: auto;" />
<br>
Daily Discharge Data Summary for the Period of Record (Units:m^3^ d^-1^)

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##       0       0       0  269489  304966 2903479
```

Daily Discharge Data Summary for the last 10-WYs (May 2005 - Apirl 2016; Units:m^3^ d^-1^)

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##       0       0       0   45473       0 1870435
```

Water Year Discharge Data Summary for the Period of Record (Units:m^3^ WY^-1^)

```
##      Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
##         0  19061641  86091688  98434439 152901708 350523816
```

Water Year Discharge Data Summary for the last 10-WYs (2006-2016; Units:m^3^ d^-1^)

```
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
##        0  3301060 16335179 16609869 28502853 37756821
```
<br>

## S200
<img src="SouthDade_summary_files/figure-html/HydroPlots10-1.png" style="display: block; margin: auto;" />
<br>
Daily Discharge Data Summary for the Period of Record (Units:m^3^ d^-1^)

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##       0       0  185977  187771  368663  562518
```

Daily Discharge Data Summary for the last 10-WYs (May 2005 - Apirl 2016; Units:m^3^ d^-1^)

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##       0       0  185977  187771  368663  562518
```

Water Year Discharge Data Summary for the Period of Record (Units:m^3^ WY^-1^)

```
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
##        0 53925706 77347966 59035334 79131865 84771135
```

Water Year Discharge Data Summary for the last 10-WYs (2006-2016; Units:m^3^ d^-1^)

```
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
##        0 53925706 77347966 59035334 79131865 84771135
```
<br>
## S332
<img src="SouthDade_summary_files/figure-html/HydroPlots11-1.png" style="display: block; margin: auto;" />
<br>
Daily Discharge Data Summary for the Period of Record (Units:m^3^ d^-1^)

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##       0       0       0  155156  229245 1319098
```

Daily Discharge Data Summary for the last 10-WYs (May 2005 - Apirl 2016; Units:m^3^ d^-1^)

```
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
##    0.000    0.000    0.000    2.229    0.000 4354.912
```

Water Year Discharge Data Summary for the Period of Record (Units:m^3^ WY^-1^)

```
##      Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
##         0        37  30470197  56222650  74940275 258589560
```

Water Year Discharge Data Summary for the last 10-WYs (2006-2016; Units:m^3^ d^-1^)

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##    0.00    0.00    0.00  788.34   48.93 5773.93
```
<br>

## S175
<img src="SouthDade_summary_files/figure-html/HydroPlots12-1.png" style="display: block; margin: auto;" />
<br>
Daily Discharge Data Summary for the Period of Record (Units:m^3^ d^-1^)

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##       0       0       0  109108       0 1695235
```

Daily Discharge Data Summary for the last 10-WYs (May 2005 - Apirl 2016; Units:m^3^ d^-1^)

```
##      Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
##       0.0       0.0       0.0     659.1       0.0 1657239.9
```

Water Year Discharge Data Summary for the Period of Record (Units:m^3^ WY^-1^)

```
##      Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
##         0     11511  12681126  39852984  77431119 139626639
```

Water Year Discharge Data Summary for the last 10-WYs (2006-2016; Units:m^3^ d^-1^)

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##       0    1541    3401  240761   14985 2553080
```
<br>

## S199
<img src="SouthDade_summary_files/figure-html/HydroPlots13-1.png" style="display: block; margin: auto;" />
<br>
Daily Discharge Data Summary for the Period of Record (Units:m^3^ d^-1^)

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##       0       0  103796  167436  368559  561686
```

Daily Discharge Data Summary for the last 10-WYs (May 2005 - Apirl 2016; Units:m^3^ d^-1^)

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##       0       0  103796  167436  368559  561686
```

Water Year Discharge Data Summary for the Period of Record (Units:m^3^ WY^-1^)

```
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
##        0 44200599 49271552 49829084 76430499 79242769
```

Water Year Discharge Data Summary for the last 10-WYs (2006-2016; Units:m^3^ d^-1^)

```
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
##        0 44200599 49271552 49829084 76430499 79242769
```
<br>

## S177
<img src="SouthDade_summary_files/figure-html/HydroPlots14-1.png" style="display: block; margin: auto;" />
<br>
Daily Discharge Data Summary for the Period of Record (Units:m^3^ d^-1^)

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##       0       0       0  266517  341010 4319584
```

Daily Discharge Data Summary for the last 10-WYs (May 2005 - Apirl 2016; Units:m^3^ d^-1^)

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##       0       0   88309  299787  475114 4319584
```

Water Year Discharge Data Summary for the Period of Record (Units:m^3^ WY^-1^)

```
##      Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
##         0  11354822 112414406  96524827 153590115 217158441
```

Water Year Discharge Data Summary for the last 10-WYs (2006-2016; Units:m^3^ d^-1^)

```
##      Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
##  22709645  64530493  92760099 109504021 159584089 217158441
```
<br>

## S178
<img src="SouthDade_summary_files/figure-html/HydroPlots15-1.png" style="display: block; margin: auto;" />
<br>
Daily Discharge Data Summary for the Period of Record (Units:m^3^ d^-1^)

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##       0       0       0    4822       0 2152330
```

Daily Discharge Data Summary for the last 10-WYs (May 2005 - Apirl 2016; Units:m^3^ d^-1^)

```
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
##    0.000    0.000    0.000    1.632    0.000 6556.834
```

Water Year Discharge Data Summary for the Period of Record (Units:m^3^ WY^-1^)

```
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
##        0        0   312502  1761236  1312076 15085123
```

Water Year Discharge Data Summary for the last 10-WYs (2006-2016; Units:m^3^ d^-1^)

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##     0.0     0.0     0.0   596.1     0.0  6556.8
```
<br>

## S18C
<img src="SouthDade_summary_files/figure-html/HydroPlots16-1.png" style="display: block; margin: auto;" />
<br>
Daily Discharge Data Summary for the Period of Record (Units:m^3^ d^-1^)

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##       0       0       0  380148  295541 7133175
```

Daily Discharge Data Summary for the last 10-WYs (May 2005 - Apirl 2016; Units:m^3^ d^-1^)

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##       0       0       0   83488       0 5362781
```

Water Year Discharge Data Summary for the Period of Record (Units:m^3^ WY^-1^)

```
##      Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
##         0         0 119836804 138854075 241249584 434290581
```

Water Year Discharge Data Summary for the last 10-WYs (2006-2016; Units:m^3^ d^-1^)

```
##      Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
##         0         0         0  30495868   1908675 232517409
```
<br>

## S197
<img src="SouthDade_summary_files/figure-html/HydroPlots17-1.png" style="display: block; margin: auto;" />
<br>
Daily Discharge Data Summary for the Period of Record (Units:m^3^ d^-1^)

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##       0       0       0  103436       0 8661064
```

Daily Discharge Data Summary for the last 10-WYs (May 2005 - Apirl 2016; Units:m^3^ d^-1^)

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##       0       0       0   45733       0 6839096
```

Water Year Discharge Data Summary for the Period of Record (Units:m^3^ WY^-1^)

```
##      Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
##         0   4519677  19998345  37781381  43366579 180915196
```

Water Year Discharge Data Summary for the last 10-WYs (2006-2016; Units:m^3^ d^-1^)

```
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
##        0  2699948 10438040 16705106 16782842 81209281
```
<br>


# Water Quality Information

Provided in this section are peroid of record water quality data and summarise of data located in the South Florida Water Management Districts [DBHYDRO](http://my.sfwmd.gov/dbhydroplsql/show_dbkey_info.main_menu). All structure-water quality monitoring location pairings used to construct these water quality time-series can be found in this [file](http://publicfiles.dep.state.fl.us/owp/SouthDade_Info/DataInventory_existing.xlsx).

<br>
Below are a series of plots for each structure with accessible/available data. The data are presented both as individual grab samples (i.e. raw data) and annual flow-weighted mean concentrations based on the Florida water year (May 1 - Apirl 30). Water quality data were screened for fatal qualifiers and paired with flow data for each structure with available data. Flow-weighted mean concentrations were calcualted for structures with greater than three samples per year using only positive flow. Similar to the plots above for discharge data, three plots were developed to represent each structure and the associated water quality (Total Phosphorus). The three plots include (1) the top left plot displaying a percent exceedance curve for all data (solid line) and only flowing conditions (dashed line) based on grab sample (weekly, biweekly or monthly depending on structure); (2) top right plot displays raw grab sample total phosphorus concentration with points color coded relative to flowing conditions (blue: flowing, red: not flowing); (3) bottom plot displays annual flow-weighted mean concentrations and weighted-standard error (FWM $\pm$ SE~wtd~). All concentrations are expressed as $\mu$g L^-1^ (i.e. parts-per-billion).



<br>
<br>

# {.tabset .tabset-fade}
## S331
<img src="SouthDade_summary_files/figure-html/wqplot1-1.png" style="display: block; margin: auto;" />
<br>

## S173
<img src="SouthDade_summary_files/figure-html/wqplot2-1.png" style="display: block; margin: auto;" />
<br>

## S357
<img src="SouthDade_summary_files/figure-html/wqplot3-1.png" style="display: block; margin: auto;" />
<br>

## S332B
<img src="SouthDade_summary_files/figure-html/wqplot4-1.png" style="display: block; margin: auto;" />
<br>

## S332C
<img src="SouthDade_summary_files/figure-html/wqplot5-1.png" style="display: block; margin: auto;" />
<br>

## S174
<img src="SouthDade_summary_files/figure-html/wqplot6-1.png" style="display: block; margin: auto;" />
<br>

## S332D
<img src="SouthDade_summary_files/figure-html/wqplot7-1.png" style="display: block; margin: auto;" />
<br>

## S176
<img src="SouthDade_summary_files/figure-html/wqplot8-1.png" style="display: block; margin: auto;" />
<br>

## S200
<img src="SouthDade_summary_files/figure-html/wqplot9-1.png" style="display: block; margin: auto;" />
<br>

## S332
<img src="SouthDade_summary_files/figure-html/wqplot10-1.png" style="display: block; margin: auto;" />
<br>

## S175
<img src="SouthDade_summary_files/figure-html/wqplot11-1.png" style="display: block; margin: auto;" />
<br>

## S199
<img src="SouthDade_summary_files/figure-html/wqplot12-1.png" style="display: block; margin: auto;" />
<br>

## S177
<img src="SouthDade_summary_files/figure-html/wqplot13-1.png" style="display: block; margin: auto;" />
<br>

## S178
<img src="SouthDade_summary_files/figure-html/wqplot14-1.png" style="display: block; margin: auto;" />
<br>

## S18C
<img src="SouthDade_summary_files/figure-html/wqplot15-1.png" style="display: block; margin: auto;" />
<br>

## S197
<img src="SouthDade_summary_files/figure-html/wqplot16-1.png" style="display: block; margin: auto;" />
<br>

<br>
<br>
***
<br>
<br>
