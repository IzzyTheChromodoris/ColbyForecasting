Forecasting Cetorhinus Maximus
================

Introduction

Cetorhinus Maximus, or The Basking Shark, is the second-largest species
of shark in the world. Basking Sharks are only just beginning to be
understood for their strange biology and ecology. While other species
may have information regarding overall global population distributions
and life spans, Basking Sharks lack in this data(Westgate et al). But as
mentioned by David W. Sims in Chapter 3 of his book on Advances in
Marine Biology: “Recent advances in electronic tag technology have
enabled considerable progress within the last few years to be made in
identifying movements, behavior and habitat preferences.” Forecasting
becomes a challenge when many details are up for speculation, but
understanding even the smallest details can help when attempting to make
a prediction on the distribution of Basking Sharks in the year 2050 and
beyond.

DATA and MODELS
![](Forecasting-Izzy-Gottlieb_files/figure-gfm/summer_distrib-1.png)<!-- -->
Figure 1: The numbers of Basking Sharks over a normal year. Notice that
the majority of the sharks are seen between the months of April and
August, with a majority in June. This tell us that Basking Sharks prefer
warmer temperatures, specifically temperatures in the warmer temperate
regions (Sims,2008). Knowing that Basking Sharks prefer warmer waters
doesn’t tell us enough about their distribution in the past and future,
because even if the climate warms, why would the Basking Sharks care? A
good reason for why this matters is because of prey preferences. First,
Basking Sharks, like many other filter-feeders, travel along the
currents and follow their prey. Unlike species that are smaller and
require less microscopic food to sustain basic functions, the Basking
Shark requires a high density of plankton in order to survive. Basking
Sharks, as well as other predators in the area, such as the endangered
North Atlantic Right Whale, feed on copepods like Calanus finmarchicus
or C.fin. While Basking Sharks may not have a strict preference in
temperatures, C.fin do. Warming global temperatures may displace
populations of this food source and may cause their predators to move
elsewhere.

    ## Please point your browser to the following url:

    ## https://api.obis.org/v3/occurrence/0005bdf5-aeb9-4804-b56b-95f98597bffe

![](Forecasting-Izzy-Gottlieb_files/figure-gfm/plot_month3-1.png)<!-- -->
Figure 2: The same monthly distribution but looking at Calanus
finmarchicus.Unfortunatly, this data doesn’t provide enough information
to determine if there is a preference. If there was a spike in one month
rather than the other, this would tell us that there is a strong
preference. It is clear that the prey do have preferences. Experiments
have been conducted before to determine how temperatures impact the life
cycle of C.fin. Below is the Individual Base model described in Figure 2
of the journal article, “Coastal Amplifications of supply and transport
(CAST): a new hypothesis about the persistence of Calanus finmarchicus
in the Gulf of Maine.” ![see Ji et al 2017](images/Rubeo.png) In
addition, there is a range in change in development time in the species
with an x-value of temperature. It is important to note that as the
temperature goes up, the development time goes down. This change is seen
between N3-C5 range, Egg to C5 range, and Egg to Adult range as shown
below. ![see Ji et al 2017](images/RubeoJi2.png) So now we know that
prey distribution matters. Next, we shall create graphs for both the
current distribution of Basking Sharks as well as the distribution of
Calanus finmarchicus. It is highly unlikely that this alone matters for
forecasting the future of Cetorhinus maximus. For example, boating
accidents and poaching may be an important factor as seen with Right
Whales(Ross et al,.2021).
![](Forecasting-Izzy-Gottlieb_files/figure-gfm/load_obs_mask-1.png)<!-- -->
Figure 3: A visualization of where the Basking Sharks are located and
during which months. The data has been thinned to not include NA values.
Figure 3 proves the observation in Figure 1, so it is clear that the
Basking Sharks are seen more frequently in between the months of May and
August, with the maximum located in June and the minimum located in
January. This matters because it can be compared to the changes in
distribution with Calanus finmarchicus. When looking at the northeastern
ocean database, changes in the density of C.fin can be seen over spring,
summer, fall, and winter between the range of year 2003-2009 and
2010-2021. (INSERT PICTURES)Figure 3a, 3b, 3c, 3d

![](Forecasting-Izzy-Gottlieb_files/figure-gfm/bias_map-1.png)<!-- -->
Figure 4: Bias map of all observations. A majority of the sightings
appear to be located in a central area. It is unknown why, but that is
why we will be looking at co-variables that might influence their range.
![](Forecasting-Izzy-Gottlieb_files/figure-gfm/read_brickman-1.png)<!-- -->![](Forecasting-Izzy-Gottlieb_files/figure-gfm/read_brickman-2.png)<!-- -->
Figure 5: The covariables. These results show that a forecast has a high
chance of being inaccurate due to the variance of the data. Some data is
simple, such as depth revealing that both presence and background class
Basking Sharks seem to prefer shallower water with an inconsistent
preference in sea surface temperature and a more consistent preference
in sea bottom temperature. Although this may seem odd, considering the
date on Calanus finmarchicus, it makes sense that a specific predator
would spend more time in a location where their prey may have a stronger
preference. In relation to Calanus finamarchicus, it has been stated in
many studies that they are extremely sensitive to changes in
temperatures. (Rubao Ji et al,2017). ![see Grieve et al
2017](images/Forecast_CFin.png) According to the above projections based
on C.fin samples taken between the years 1977-2013, the population of
the copepods will get progressively low in both RCP 4.5 and RCP 8.5
figures showing density within the May-June range. The change in density
with the forecast model is significant and mirrors the changes mentioned
in the observed density over different seasons and year ranges in
figures 3a, 3b, 3c, and 3d. The change occuring in the year range
2003-2009 and 2010-2021 seems similar to the change occurring between
the year range 2041-2060 and 2081-2100. This shows that both models can
be reliable since both models predict a downward trend in density.

Forecast

There were two methods of forecasting the presence of Cetorhinus
Maximus. While looking at data from Right Whales and Calanus
finmarchicus may provide information about prey and potential shared
predators, the difference is still clear: Basking Sharks aren’t right
whales and the data deficiency makes forecasting accuracy decrease. One
method is through R-studio with the figure below:
![](Forecasting-Izzy-Gottlieb_files/figure-gfm/load_data-1.png)<!-- -->
Figure 6: Spatial training data. Like the Ai model mentioned later, the
data is fed into a system and separated into testing and training.
![](Forecasting-Izzy-Gottlieb_files/figure-gfm/tr_data-1.png)<!-- -->![](Forecasting-Izzy-Gottlieb_files/figure-gfm/tr_data-2.png)<!-- -->
Figure 7: The confusion matrix for the data as well as the accuracy of
different methods of forecasting. Based off of this information and the
“AUC:” values we can see that a random forest(default_rf) model would
work best with accuracy at 0.810. The second best option is a boosted
tree format. The accuracy isn’t too low to make a prediction in other
formats, but accuracy is important when making forecasts.
![](Forecasting-Izzy-Gottlieb_files/figure-gfm/rf-1.png)<!-- -->

Figure 8: The forecast with different covariables.

As mentioned previously, there was a second method to predicting the
distribution of Basking Sharks.In addition to the previous method of
forecasting, an AI model was created using AnythingLLM, Python3, and
Ollama. The chosen base model for the AI is Google Gemini. The data in
this paper as well as the citations described were all fed into the
machine. The prompt generated was something like “based on the given
information, predict the presence of Cetorhinus Maximus/Basking Sharks
in the year 2050.” Its result is as follows, but trimmed down for
convenience due to specific papers being repeated within the answer. It
should also be mentioned that each line will have commentary: “Current
and Historical Presence: Seasonal Presence: Basking sharks are observed
seasonally in the Gulf of Maine and surrounding waters. Peak sightings
in May, June, and July, with a noticeable presence from April through
October.” This first line shows that our observations on a preferred
temperature or seasonal presence is correct or at least noticed in other
algorithms. “Geographic Distribution: Significant basking shark presence
along the coast of Maine, extending south into the broader northeastern
United States continental shelf waters, including the Gulf of Maine.
Aggregations: Large aggregations, though relatively rare compared to
individual sightings (89% were single sightings, 99% were groups of
seven or fewer), have been documented in summer and autumn months off
the northeastern United States, including the Gulf of Maine. The largest
recorded aggregation included up to 1398 individuals. Environmental
Preferences: These aggregations are associated with sea surface
temperatures (SSTs) typically ranging from 13 to 24°C and chlorophyll-a
(Chl-a) concentrations of 0.4 to 2.6 mg m⁻³. They are linked to dense
zooplankton patches, such as Centropages typicus.” Many of this
information is already known such as clusters of individuals sighted and
the preferred sea surface temperatures. “Predicted Presence in the Gulf
of Maine in 2050: Given the slow recovery rate, historical depletion,
and potential impacts of climate change, it is unlikely that the
presence of Basking Sharks in the Gulf of Maine will significantly
increase by 2050, and their conservation status is likely to remain a
concern.” This is a simple prediction, but the Ai goes further to
describe key factors that influenced its prediction: “Slow Recovery:
Basking sharks have slow growth rates, late maturity, and low
productivity, making their populations highly sensitive to exploitation
and recovery very slow. The eastern Canadian population is considered
depleted. Climate Change Impacts on Habitat: The Gulf of Maine is
experiencing rapid warming. If SSTs in the region consistently exceed
the basking sharks’ preferred range (13–24°C), their distribution could
shift northward or to deeper waters. This could potentially reduce their
presence in traditional Gulf of Maine foraging grounds. Climate Change
Impacts on Prey: Basking sharks rely on dense zooplankton blooms for
feeding. Climate change can alter oceanographic conditions, impacting
the timing, location, and species composition of these zooplankton
blooms (e.g., chlorophyll-a concentrations). Disruptions to their
primary food source could directly affect their presence and foraging
success in the Gulf of Maine. Observed Trends: While the “Counts per
year” graph shows an increase in recorded sightings from around 2000 to
2015, it also indicates a sharp decline in counts between 2015 and 2020.
Without specific data on survey effort, it’s difficult to interpret this
solely as a population trend, but it does not suggest a robust, rapidly
recovering population. In summary, Basking Sharks are likely to continue
to be present in the Gulf of Maine during summer and autumn months in
2050, given its historical importance as a foraging ground. However,
their abundance is expected to remain low due to inherent biological
limitations for recovery and potential shifts in habitat suitability and
prey availability driven by ongoing climate change.” There is a graph
here unmentioned until now so below is Figure 9: the change in the
presence of Basking sharks over many year. This wasn’t mentioned
previously due to the lack of definitive proof that specific years had
more of an impact than others.
![](Forecasting-Izzy-Gottlieb_files/figure-gfm/counts_per_year-1.png)<!-- -->
Figure 9: Counts per year. There is a spike in population in 2002, a
decrease in 2010, an increase a year later, and a sharp increase in
2013. Numbers then decreased in 2020. Numbers were low in previous years
as well.

Conclusion

The future may be AI, but AI can only go so far with a forecast. As
demonstrated in the overview above, the accuracy of an AI is near
equivalent to other forms of predicting. In conclusion, there needs to
be increased efforts in learning more about these creatures and perhaps
understanding variables that may have been overlooked, such as boating
routes and whale watching sights. Until then, scientists will celebrate
any discovery that may hold the secret to saving the oceans.

Citations

Andrew J Westgate, Heather N. Koopman, Zach A. Siders, Sarah N.P. Wong,
Robert A. Ronconi, Population density and abundance of basking sharks
Cetorhinus maximus in the lower bay of Fundy, Canada, Department of
Biology and Marine Biology, Volume 23, published online March 10.

Camille H. Ross, Daniel E. Pendleton, Benjamin Tupper, David Brickman,
Monica A. Zani, Charles A. Mayo, Nicholas R. Record: Projecting regions
of North Atlantic right whale, Eubalaena glacialis, habitat suitability
in the Gulf of Maine for the year 2050, Collections: Knowledge Domain:
Ocean Science , Special Feature: Gulf of Maine 2050: Visioning Regional
Resilience and Sustainability, Elementa: Science of the Anthropocene
(2021) 9 (1): 00058. Published online April 28,2021.
<https://doi.org/10.1525/elementa.2020.20.00058>

David W. Sims,Chapter 3 Sieving a Living: A Review of the Biology,
Ecology and Conservation Status of the Plankton‐Feeding Basking Shark
Cetorhinus Maximus, Advances in Marine Biology, Academic Press, Volume
54, 2008, Pages 171-220, ISSN 0065-2881,ISBN 9780123743510,
<https://doi.org/10.1016/S0065-2881(08)00003-5>.

Grieve, B.D., Hare, J.A. & Saba, V.S. Projecting the effects of climate
change on Calanus finmarchicus distribution within the U.S. Northeast
Continental Shelf. Sci Rep 7, 6264 (2017).
<https://doi.org/10.1038/s41598-017-06524-1>

Rubao Ji, Zhixuan Feng, Benjamin T. Jones, Cameron Thompson, Changsheng
Chen, Nicholas R. Record, Jeffrey A. Runge, Coastal amplification of
supply and transport (CAST): a new hypothesis about the persistence of
Calanus finmarchicus in the Gulf of Maine, ICES Journal of Marine
Science, Volume 74, Issue 7, September-October 2017, Pages 1865–1874,
<https://doi.org/10.1093/icesjms/fsw253>

Stefán Th Eysteinsson, María Gudjónsdóttir, Sigrún H. Jónasdóttir,
Sigurjón Arason, Review of the composition and current utilization of
Calanus finmarchicus – Possibilities for human consumption, Trends in
Food Science & Technology, Volume 79, 2018, Pages 10-18, ISSN 0924-2244,
<https://doi.org/10.1016/j.tifs.2018.06.019>.
