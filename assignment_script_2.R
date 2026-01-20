
source("setup.R")
# ----------------------
x = read_observations() |>
  print()
# ----------------------
  
#   Simple feature collection with 1 feature and 4 fields
# Geometry type: MULTIPOINT
# Dimension:     XY
# Bounding box:  xmin: -73.667 ymin: 38.8414 xmax: -65.07169 ymax: 45.1
# Geodetic CRS:  WGS 84
# # A tibble: 1 × 5
# `"SST"` `"depth"` `"SSS"`     n                                                             geom
# * <chr>   <chr>     <chr>   <int>                                                 <MULTIPOINT [°]>
#   1 SST     depth     SSS     10969 ((-65.18456 42.58157), (-65.18317 42.53301), (-65.22487 42.5731…
  
  # ```{r}



# Simple feature collection with 10969 features and 5 fields
# Geometry type: POINT
# Dimension:     XY
# Bounding box:  xmin: -73.667 ymin: 38.8414 xmax: -65.07169 ymax: 45.1
# Geodetic CRS:  WGS 84
# # A tibble: 10,969 × 6
# # Groups:   "SST", "depth", "SSS" [1]
# month class                      geom `"SST"` `"depth"` `"SSS"`
# <fct> <fct>               <POINT [°]> <chr>   <chr>     <chr>  
#   1 Jan   presence   (-68.65083 43.09529) SST     depth     SSS    
# 2 Jan   presence     (-67.0988 45.0853) SST     depth     SSS    
# 3 Jan   background (-71.02529 40.93629) SST     depth     SSS    
# 4 Jan   background (-68.39285 42.08798) SST     depth     SSS    
# 5 Jan   background (-68.31059 42.25251) SST     depth     SSS    
# 6 Jan   background (-68.47512 43.73326) SST     depth     SSS    
# 7 Jan   background (-69.21549 41.67667) SST     depth     SSS    
# 8 Jan   background (-72.01246 40.36045) SST     depth     SSS    
# 9 Jan   background (-69.29775 41.84119) SST     depth     SSS    
# 10 Jan   background (-71.84793 39.70234) SST     depth     SSS    
# # ℹ 10,959 more rows
# # ℹ Use `print(n = ...)` to see more rows



# # A tibble: 24 × 3
# month class          n
# <fct> <fct>      <int>
#   1 Jan   presence       2
# 2 Jan   background   642
# 3 Feb   presence       8
# 4 Feb   background   642
# 5 Mar   presence      12
# 6 Mar   background   642
# 7 Apr   presence     181
# 8 Apr   background   642
# 9 May   presence     667
# 10 May   background   642


# Simple feature collection with 24 features and 7 fields
# Geometry type: POINT
# Dimension:     XY
# Bounding box:  xmin: -72.99962 ymin: 39.07928 xmax: -65.51362 ymax: 43.89779
# Geodetic CRS:  WGS 84
# # A tibble: 24 × 8
# month class                      geom point  depth   SSS   SST  Tbtm
# * <fct> <fct>               <POINT [°]> <chr>  <dbl> <dbl> <dbl> <dbl>
#   1 Jan   presence   (-72.05151 39.07928) p1    2116.   33.3 10.9   3.72
# 2 Jan   background (-67.48795 40.36045) p2     789.   31.7  6.65  4.67
# 3 Feb   presence   (-72.00363 39.67702) p1     231.   31.9  5.73  8.64
# 4 Feb   background (-69.79134 40.60724) p2      60.4  31.2  3.58  3.89
# 5 Mar   presence       (-72.056 39.205) p1    1362.   32.4  6.98  4.13
# 6 Mar   background (-67.73474 42.66383) p2     194.   30.9  1.88  7.58
# 7 Apr   presence      (-72.263 39.4379) p1     386.   31.7  7.08  6.44
# 8 Apr   background  (-72.8351 39.20875) p2     102.   31.5  6.74 10.3 
# 9 May   presence          (-66.3 41.25) p1     281.   31.2  8.03  7.12
# 10 May   background (-71.43661 39.62007) p2    1867.   31.9 11.4   3.78
# # ℹ 14 more rows
# # ℹ Use `print(n = ...)` to see more rows
# ```

index=c(1,282,645,821,1300,1552,2095,2637,2990,3756,4092,5129,6187,6644,7031,7616,8100,8290,8958,9179,9629,10000,10324,10685)
y=slice(x,index)

db=brickman_database() |>
  filter(scenario=="PRESENT", interval=="mon")
covars=read_brickman(db)

V=extract_brickman(covars,y,form="wide")

# Simple feature collection with 16 features and 16 fields
# Geometry type: POINT
# Dimension:     XY
# Bounding box:  xmin: -72.3909 ymin: 40.4307 xmax: -68.30795 ymax: 43.49244
# Geodetic CRS:  WGS 84
# # A tibble: 16 × 17
# .id   id       basisOfRecord eventDate   year month eventTime individualCount   MLD  Sbtm   SSS
# <chr> <chr>    <chr>         <date>     <dbl> <fct> <chr>               <dbl> <dbl> <dbl> <dbl>
#   1 p01   0009275… HumanObserva… 2005-07-11  2005 Jul   NA                     NA  3.59  34.2  30.5
# 2 p02   097af4e… HumanObserva… 2004-06-24  2004 Jun   18:34:42Z               3  3.14  32.0  30.8
# 3 p03   15cca63… HumanObserva… 2012-05-18  2012 May   19:45:59Z               1  6.66  34.2  31.0
# 4 p04   1b4dade… HumanObserva… 2015-05-29  2015 May   14:33:28Z               2  5.90  34.4  30.8
# 5 p05   2c2896b… HumanObserva… 2012-07-12  2012 Jul   17:24:54Z               1  3.66  34.1  30.5
# 6 p06   3436aad… HumanObserva… 2004-06-28  2004 Jun   21:19:00Z               1  3.89  33.6  30.9
# 7 p07   4500d42… HumanObserva… 2017-08-14  2017 Aug   08:43:48                1  4.10  31.9  30.5
# 8 p08   56cf884… HumanObserva… 2016-05-26  2016 May   17:56:34Z               1  6.14  33.4  30.9
# 9 p09   620e67b… HumanObserva… 2013-06-05  2013 Jun   19:15:27Z               1  3.42  34.5  30.7
# 10 p10   7b10886… HumanObserva… 2004-06-16  2004 Jun   19:53:24Z               1  3.62  34.2  30.5
# 11 p11   85d59d3… HumanObserva… 2012-07-21  2012 Jul   17:33:22Z               1  3.38  34.5  30.6
# 12 p12   a78b7d9… HumanObserva… 2014-05-21  2014 May   14:08:18Z               1  6.19  31.1  30.9
# 13 p13   cc317df… HumanObserva… 2011-08-23  2011 Aug   11:28:20                1  4.42  31.9  30.3
# 14 p14   db2cd46… HumanObserva… 2014-06-23  2014 Jun   17:44:18Z               2  3.75  34.6  30.8
# 15 p15   e8e73b1… HumanObserva… 2004-06-16  2004 Jun   15:52:05Z               1  3.82  34.5  30.7
# 16 p16   fc8c628… HumanObserva… 2023-10-24  2023 Oct   18:20:20                1 19.8   33.9  30.9
# # ℹ 6 more variables: SST <dbl>, Tbtm <dbl>, U <dbl>, V <dbl>, Xbtm <dbl>, geom <POINT [°]>
#   