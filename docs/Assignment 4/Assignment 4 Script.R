# Assignment 4
## Elizabeth Stoner
## 11/08/2021
output:
  html_document: default
  
  #Data Visualisation 
library(tidyverse) #loads the core tidyverse package, which helps access datasets, help pages, and functions
#> ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.0 ── #list of packages loaded in with tidyverse
#> ✔ ggplot2 3.3.2     ✔ purrr   0.3.4
#> ✔ tibble  3.0.3     ✔ dplyr   1.0.2
#> ✔ tidyr   1.1.2     ✔ stringr 1.4.0
#> ✔ readr   1.4.0     ✔ forcats 0.5.0
#> ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ── #lists of any functions that might conflict with packages already loaded in R
#> ✖ dplyr::filter() masks stats::filter()
#> ✖ dplyr::lag()    masks stats::lag()


install.packages("tidyverse") #code to install tidyverse packages if not already installed. It only needs to be run once per session
library(tidyverse) #now it can load tidyverse



mpg #loads a specific type of data frame from ggplot2. We can see here it has a rectangular set of variables (columns) and observations (rows). The loaded mpg dataset has observations from the US Environmental Protection Agency on 38 models of cars. The following rows listed show each observation within the dataset. 
#> # A tibble: 234 x 11
#>   manufacturer model displ  year   cyl trans      drv     cty   hwy fl    class 
#>   <chr>        <chr> <dbl> <int> <int> <chr>      <chr> <int> <int> <chr> <chr> 
#> 1 audi         a4      1.8  1999     4 auto(l5)   f        18    29 p     compa…
#> 2 audi         a4      1.8  1999     4 manual(m5) f        21    29 p     compa…
#> 3 audi         a4      2    2008     4 manual(m6) f        20    31 p     compa…
#> 4 audi         a4      2    2008     4 auto(av)   f        21    30 p     compa…
#> 5 audi         a4      2.8  1999     6 auto(l5)   f        16    26 p     compa…
#> 6 audi         a4      2.8  1999     6 manual(m5) f        18    26 p     compa…
#> # … with 228 more rows



ggplot(data = mpg) + #Creates a plot of the dataset mpg. This first line specifically creates an empty graph with the data argument as mpg. 
  geom_point(mapping = aes(x = displ, y = hwy)) #The geom_point function adds a layer of points to the plot, creating a scatterplot. Mapping specifies that within the plot the variable displ will be on the x-axis and the variable hwy will be on the y-axis



ggplot(data = <DATA>) + #Allows the code to become a reusable template for making grpahs through ggplot. Any of the bracketed sections can be replaced with actual data, geom-function, or mappings depending on the necessary template.
  <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>)) #Same function of making a template with the specified geom_function and mappings



ggplot(data = mpg) + #mpg plot
  geom_point(mapping = aes(x = displ, y = hwy, color = class)) #Maps the points on the plot with the specified axes like before, this time mapping the colors of the points to the class variable, which shows each class as a different color to visualize the distribution of class on the plot. The aes() funciton maps an aesthetic to a variable and assigns a level of the aesthetic to each variable value, which is called scaling. ggplot also provides a legend in the graph.



ggplot(data = mpg) + #mpg plot
  geom_point(mapping = aes(x = displ, y = hwy, size = class)) #This performs the same function as the earlier r chunk but this time instead of color the aesthetic assigned is size. Each type of class is assigned a different point size, and a legend is provided. 
#> Warning: Using size for a discrete variable is not advised. #Warning that using size to map and visualize an unordered variable is a bad idea. 



# Left
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class)) #Mapping class with the alpha aesthetic, which adjusts the transparency of points based on their class using the scaling process.

# Right
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class)) #Mapping class with the shape aesthetic, which assigns a different shape as the point for each class value through scaling. Using the aes() function gathers each mapping from the layers and passes them tot he layer's mapping argument. The function associates the specific aesthetic with the variable it is meant to display. 



ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue") #Sets the aesthetic properties of the geom_point manually, here making all of the plot points blue. This just changes the plot's appearance. It doesn't convey information about the plot. When setting the aesthetic manually it has to be coded outside of the aes() function. There are codes for different levels that can be used for setting the aesthetic.



ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue")) #This code demonstrates what happens when the aesthetic is not coded properly and is instead inside the aes() function. On the plot the points are not blue, but are labeled blue. This code allows ggplot to pick a random color aesthetic for which each point is categorized in the variable "blue."



ggplot(data = mpg) 
+ geom_point(mapping = aes(x = displ, y = hwy)) #Faulty code in which the "+" was put at the beginning instead of the end of the line, which will produce an error message. If the error is unclear, the problem can be solved by getting help with the ?function_name command.



ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2) #This line facets the plot, which displays one subset of the data. Here the use of "~ class" means that the plot is being faceted by one variable (class). The variable used in the facet_wrap() function needs to be discrete. Nrow=2 specifies that the plot should contain 2 rows.



ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl) #This causes the plot to be faceted by 2 variables, which are separated by the ~. One of the two variables could also be replaced by a period to avoid faceting in the rows or columns dimension. 



ggplot(data = mpg) + #empty graph for plotting mpg dataset
  geom_point(mapping = aes(x = drv, y = cyl)) #Adding the layer of points to the plot with an aesthetic applied to the variables drv and cyl. Since the aesthetic was not specified, ggplot will apply whichever aesthetic makes sense for the data. Also maps drv onto the x-axis and cyl onto the y-axis. 



ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + #Maps the same plot as earlier
  facet_grid(drv ~ .) #Now a facet is applied, which displays drv, but does not facet cyl

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl) #The opposite is the case here so cyl is faceted but drv is not. Using this r chunkw e get to see both faceted separately. 



ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + #Same plot that has been used
  facet_wrap(~ class, nrow = 2) #This line facets the plot, which displays one subset of the data. Here the use of "~ class" means that the plot is being faceted by one variable (class). The variable used in the facet_wrap() function needs to be discrete. Nrow=2 specifies that the plot should contain 2 rows.



# left
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) #This code uses the point geom to create a normal scatterplot of the data. This maps the same plot as was used earlier with the variable displ on the x-axis and hwy on the y-axis.

# right
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy)) #This code uses the smooth geom, which generates a smooth line fitted to the data. 



ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv)) #Uses the geom_smooth function to generate a smooth line fitted to the data. Also includes the drv variable being mapped to linetype. So there will be a different line and linetype for each value of the variable set too linetype (in this case, the variable drv).



ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy)) #This code uses the smooth geom, which generates a smooth line fitted to the data.

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv)) #Uses the geom_smooth function to generate a smooth line fitted to the data. Also includes the group aesthetic to drv, a categorical variable, to draw multiple objects. ggplot2 draws a separate object for each unique value of the grouping variable.

ggplot(data = mpg) +
  geom_smooth( #Uses the geom_smooth function to generate a smooth line fitted to the data.
    mapping = aes(x = displ, y = hwy, color = drv),
    show.legend = FALSE
  )  #COdes the color aesthetic to drv, a categorical variable, so that ggplot2 assigns a separate color for each unique value of the variable drv.



ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy)) #Displays multiple geoms in the same plot by adding multiple geom functions to the same ggpplot



ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + #This mapping function treats the set of mappings written here as global mappings that apply to each geom in the graph
  geom_point() + #Produces scatterplot
  geom_smooth() #Produces smooth line fitted to the data



ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + #Mappings placed within the ggplot function are treated as global 
  geom_point(mapping = aes(color = class)) + #Mappings placed within the geom function are treated as local for that specific layer, so that different aesthetics can be displayed in different layers. In this case the color aesthetic only applies to the scatterplot layer based on the class variable
  geom_smooth()



ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + #Mappings placed within the ggplot function are treated as global 
  geom_point(mapping = aes(color = class)) +  #Mappings placed within the geom function are treated as local for that specific layer, so that different aesthetics can be displayed in different layers. In this case the color aesthetic only applies to the scatterplot layer based on the class variable
  geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE) #Different data is being specified in the smooth geom. The line displays the new specified category of class "subcompact." This only applies for this layer. se = FALSE means confidence interval is not shown around the line.



ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + #Global mapping with the colors of the points depending on the drv variable.
  geom_point() + 
  geom_smooth(se = FALSE) #se argument shows the confidence interval around the line when applied to geom_smooth. When set to =FALSE it does not show this interval.



ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + #This mapping function treats the set of mappings written here as global mappings that apply to each geom in the graph
  geom_point() + #scatterplot
  geom_smooth() #smooth line to fit data

ggplot() + #ggplot does not have global mappings
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy)) #Here both geoms will display on the same plot. You would want to use a different code in the case that you want the axes to display different variables



ggplot(data = diamonds) + #dataset used for ggplot now is diamonds
  geom_bar(mapping = aes(x = cut)) #geom function used here creates a bar chart. The variable specified via mapping and the aesthetic is the cut, displayed on the x-axis. The y-axes not specified in the code is automatically set to display the frequency (or count) at which each cut category appears in the data. The program uses a stat to do this. 



ggplot(data = diamonds) + #dataset used for ggplot now is diamonds
  stat_count(mapping = aes(x = cut)) #This code creates the same plot as before, just using stat_count. This works because stat_count was the default stat for geom_bar.



demo <- tribble(
  ~cut,         ~freq,
  "Fair",       1610,
  "Good",       4906,
  "Very Good",  12082,
  "Premium",    13791,
  "Ideal",      21551
) #Used to override default stat by packing the frequency of the cut categories into a vector called demo. Takes into account the frequency of each category listed under the cut variable. 

ggplot(data = demo) + #New ggplot using new vector demo as the dataset
  geom_bar(mapping = aes(x = cut, y = freq), stat = "identity") #New bar chart mapping cut categories on the x-axis and their frequency on the y-axis. 



ggplot(data = diamonds) + #ggplot with diamonds as dataset
  geom_bar(mapping = aes(x = cut, y = stat(prop), group = 1)) #Bar chart with overriden default mapping from the transformed variables to aesthetics. The y-axis has been set to display a statistical transformation (stat) of proportion rather than count. The group=1 function specifies which row will be evaluated with the proportion.



ggplot(data = diamonds) + 
  stat_summary( #summarizes the y values for each unique x value
    mapping = aes(x = cut, y = depth), #aesthetic mapping of the x and y axes
    fun.min = min, #supplies the function minimum of the vector
    fun.max = max, #Supplies the function maximum of the vector
    fun = median #Supplies the function median of the vector
  )



ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = after_stat(prop))) #Bar chart with overriden default mapping from the transformed variables to aesthetics. The y-axis has been set to display a statistical transformation (stat) of proportion rather than count. Does not include group=1 so the proportion will end up being the whole dataset compared with the whole dataset (100). 
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = color, y = after_stat(prop))) #Same issue as previous bar chart, but includes the command fill=color so the bars will have color. 



ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, colour = cut)) #bar chart with color command so that each bin for the variable cut has its own outline
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut)) #bar chart with fill command that fills each bar for the variable cut with its own color



ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity)) #bar chart with fill aesthetic applied to new variable, clarity so that each colored rectangle represents a combination of the two variables cut and clarity. The bars are stacked automatically. 



ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) + 
  geom_bar(alpha = 1/5, position = "identity") #position="identity" places the objects exactly where they fall in the graph, which causes overlaps of the bars. The alpha adjustment makes the bars slightly transparent. 
ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) + 
  geom_bar(fill = NA, position = "identity") #position="identity" places the objects exactly where they fall in the graph, which causes overlaps of the bars. fill=NA makes the bars completely transparent. 



ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill") #position="fill" command stacks the bars, but makes each set of bars the same height, making comparison easier. 



ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge") #position="dodge" puts overlapping objects beside each other. 



ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), position = "jitter") #position="jitter" function adds a small amount of random noise to each point, which spreads points out because no two points are likely to receive the same amount of random noise. 



ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + #ggplot with mpg dataset. There is global mapping with cty as the x-axis and hwy as the y-axis
  geom_point() #scatterplot of the dataset with the global mapping of the axes



ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + #ggplot with mpg dataset. There is global mapping with class as the x-axis and hwy as the y-axis
  geom_boxplot()
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + #ggplot with mpg dataset. There is global mapping with class as the x-axis and hwy as the y-axis
  geom_boxplot() + #creates poxplot of data
  coord_flip() #switches the x and y axes of the plot, which can help with issues of overlapping. 



nz <- map_data("nz") #saves map_data into a new vector "nz"

ggplot(nz, aes(long, lat, group = group)) + #map plot of nz with latitude (y-axis) and longitude (x-axis)
  geom_polygon(fill = "white", colour = "black") #polygon plot filled in white, outlined in black

ggplot(nz, aes(long, lat, group = group)) + #map plot of nz with latitude (y-axis) and longitude (x-axis)
  geom_polygon(fill = "white", colour = "black") +
  coord_quickmap() #sets the aspect ratio correctly for maps, so the plotted map is not warped



bar <- ggplot(data = diamonds) + #saves chunk of code into a bar vector
  geom_bar( #geom command for a bar chart
    mapping = aes(x = cut, fill = cut), #maps variable cut along the x axis, fills cut bars with color
    show.legend = FALSE, #no legend with the plot
    width = 1 #width of the plot set to 1
  ) + 
  theme(aspect.ratio = 1) + #modify theme based on aspect ratio to equal one, making the plot a square
  labs(x = NULL, y = NULL) #No labels on either axes

bar + coord_flip() #switches the y-axis with the x-axis for the bar
bar + coord_polar() #uses polar coordinates to create a pie chart



ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + #ggplot with mpg dataset. There is global mapping with cty as the x-axis and hwy as the y-axis
  geom_point() + #scatterplot
  geom_abline() + #Reference line added to plot
  coord_fixed() #Plot with fixed aspect ratio



#Helpful code template for applying the functions described in the chapter. It includes seven parameters. Can be used to build any plot. 
ggplot(data = <DATA>) + #empty graph for plotting dataset
  <GEOM_FUNCTION>( #geom function to plot actual layer
    mapping = aes(<MAPPINGS>), #aesthetic mapping of variables
    stat = <STAT>, #statistical transformation of plot
    position = <POSITION> #position adjustment
  ) +
  <COORDINATE_FUNCTION> + #coordinate system of plot that can be adjusted
  <FACET_FUNCTION> #Split plot into facets to display subsets of the data
  

#Graphics for Communication


library(tidyverse) #Run the package tidyverse in the library



ggplot(mpg, aes(displ, hwy)) + #empty graph for plotting dataset
  geom_point(aes(color = class)) + #scatterplot with color aesthetic applied to the variable class
  geom_smooth(se = FALSE) + #adds a smooth fitted line. se=FALSE removes the confidence interval around the line
  labs(title = "Fuel efficiency generally decreases with engine size") #Creates a label for the title of the plot, which summarises the main finding



ggplot(mpg, aes(displ, hwy)) + #same plot as above
  geom_point(aes(color = class)) +
  geom_smooth(se = FALSE) +
  labs(
    title = "Fuel efficiency generally decreases with engine size", #main title label above the plot
    subtitle = "Two seaters (sports cars) are an exception because of their light weight", #subtitle for additional detail in a smaller font under the title
    caption = "Data from fueleconomy.gov" #caption adds text at the bottom right of the plot, which can be used to display the data source
  )



ggplot(mpg, aes(displ, hwy)) + #same plot
  geom_point(aes(colour = class)) +
  geom_smooth(se = FALSE) +
  labs(
    x = "Engine displacement (L)", #replaces x-axis label
    y = "Highway fuel economy (mpg)", #replaces y-axis label
    colour = "Car type" #renames the legend title
  )



df <- tibble( #constructs a data frame named df
  x = runif(10), #generates 10 random numbers for x
  y = runif(10) #generates 10 random numbers for y
)
ggplot(df, aes(x, y)) +
  geom_point() +
  labs(
    x = quote(sum(x[i] ^ 2, i == 1, n)), #quote() function allows a mathematical equation to be used as a label for the x-axis (instead of a string of text)
    y = quote(alpha + beta + frac(delta, theta)) #mathematical equation used as y-axis label
  )



best_in_class <- mpg %>% #uses tibble to pull out specific information
  group_by(class) %>% #specification of the variable from which the information is to be extracted
  filter(row_number(desc(hwy)) == 1) #filters one point by row for the variable

ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(colour = class)) + #scatterplot
  geom_text(aes(label = model), data = best_in_class) #geom_text like geom_point, but you can add labels to the actual plot. Labels the points specified using the tibble function.



ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(colour = class)) + #normal scatterplot from before
  geom_label(aes(label = model), data = best_in_class, nudge_y = 2, alpha = 0.5) #geom_label draws a rectangle behind the text, making it easier to read. label=model specifies what is to be labeled. nudge_y moves labels above the points by a factor of 2. alpha function makes the labels semi transparent by 0.5.



ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(colour = class)) + #scatterplot mapped with color aesthetic for class
  geom_point(size = 3, shape = 1, data = best_in_class) + #New scatterplot layer with size and shape specifications for the points, which highlight the best_in_class points with a circle around them
  ggrepel::geom_label_repel(aes(label = model), data = best_in_class) #ggrepel function automatically adjusts labels so they do not overlap



class_avg <- mpg %>% #new data frame for class_avg to be specified
  group_by(class) %>%
  summarise( #new data frame for labeling
    displ = median(displ), #computes median of x
    hwy = median(hwy) #computes median of y
  )
#> `summarise()` ungrouping output (override with `.groups` argument)

ggplot(mpg, aes(displ, hwy, colour = class)) +
  ggrepel::geom_label_repel(aes(label = class), #ggrepel to keep labels from overlapping. Aesthetic mapping to label class
                            data = class_avg, #data labeled is class average
                            size = 6, #plot size adjustment
                            label.size = 0, #label size adjustment
                            segment.color = NA #no specified segment color
  ) +
  geom_point() + #new scatterplot layer 
  theme(legend.position = "none") #turns the legend off



label <- mpg %>% #new data frame
  summarise( #summarise() computes specific values of x and y
    displ = max(displ), #computes maximum x value
    hwy = max(hwy), #computes maximum y value
    label = "Increasing engine size is \nrelated to decreasing fuel economy." #label for the new plot put in the upper right corner of the data frame. \n breaks label into lines
  )

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_text(aes(label = label), data = label, vjust = "top", hjust = "right") #scatterplot with specified label to be at upper right corner of the plot. vjust and hjust control the alignment of the label. They ahve nine combinations total



label <- tibble( #tibble creates new data frame
  displ = Inf, #Inf function puts label at the border fo the plot
  hwy = Inf, #label at the border of the plot
  label = "Increasing engine size is \nrelated to decreasing fuel economy." #label that will be written. \n command breaks the label into lines
)

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_text(aes(label = label), data = label, vjust = "top", hjust = "right") #label for plot at upper right corner now at the borders of the plot due to Inf command



"Increasing engine size is related to decreasing fuel economy." %>%
  stringr::str_wrap(width = 40) %>% #automatically adds line breaks based on specification of characters you want per line (in this case a maximum of 40)
  writeLines() #specification of the lines to be written
#> Increasing engine size is related to
#> decreasing fuel economy.



ggplot(mpg, aes(displ, hwy)) + #empty ggplot graph
  geom_point(aes(colour = class)) #scatterplot layer with aesthetic color for variable class



ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(colour = class)) +
  scale_x_continuous() + #x scale
  scale_y_continuous() + #y scale
  scale_colour_discrete() #default scales added by ggplot to each plot created (Format: scale_name of aesthetic_ name of scale dependent on the type of variable they align with)



ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  scale_y_continuous(breaks = seq(15, 40, by = 5)) #breaks function overrides default choice to adjust the appearance of the ticks on the axes



ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  scale_x_continuous(labels = NULL) + #labels=NULL suppresses the labels on the tick marks along the axes. Here for the x-axis
  scale_y_continuous(labels = NULL) #same for the y-axis



presidential %>% #New dataset presidential
  mutate(id = 33 + row_number()) %>% #mutate() adds new variable without dropping existing ones
  ggplot(aes(start, id)) +
  geom_point() + #scatterplot layer
  geom_segment(aes(xend = end, yend = id)) + #geom_segment creates line segments. Draws a line between x/y and xend/yend
  scale_x_date(NULL, breaks = presidential$start, date_labels = "'%y") #adjusts ticks on axes to highlight where observations occur, requires format specification



base <- ggplot(mpg, aes(displ, hwy)) + #ggplot saved as new vector "base"
  geom_point(aes(colour = class)) #scatterplot included in base

base + theme(legend.position = "left") #adjusts legend position to the left of the plot "base"
base + theme(legend.position = "top") #legend position above the plot
base + theme(legend.position = "bottom") #legend position below the plot
base + theme(legend.position = "right") # the default #default to have legend to the right of the plot



ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(colour = class)) +
  geom_smooth(se = FALSE) +
  theme(legend.position = "bottom") + #puts legend at the bottom of the plot
  guides(colour = guide_legend(nrow = 1, override.aes = list(size = 4))) #guides() controls the display of individual legends. guide_legend function shows control over the number of rows in the legend (nrow=) and overrides the original aesthetic to make the points larger (override.aes=list(size=)). 
#> `geom_smooth()` using method = 'loess' and formula 'y ~ x'



ggplot(diamonds, aes(carat, price)) + #unstransformed variables
  geom_bin2d()

ggplot(diamonds, aes(log10(carat), log10(price))) + #log transform of variables carat and price from the original plot part of aesthetic mapping
  geom_bin2d() #geom_bin2d divides plot into rectangles, then counts the number of cases in each rectangle and maps the number of cases to the rectangle's fill. Helpful for when scatterplot is overplotted. 



ggplot(diamonds, aes(carat, price)) +
  geom_bin2d() + 
  scale_x_log10() + #x-axis adjusted to log scale
  scale_y_log10() #y-axis adjusted to log scale. Makes plot easier to read



ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(color = drv)) #original scatterplot with default colors

ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(color = drv)) +
  scale_colour_brewer(palette = "Set1") #colors on scatterplot adjusted to be distinguishable by people with red-green color blindness



ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(color = drv, shape = drv)) + #includes shape differences between the categories within the variable, making the graph interpretable in black and white
  scale_colour_brewer(palette = "Set1") #red-green color blind adjustment



presidential %>% #presidential dataset
  mutate(id = 33 + row_number()) %>% #adds variable
  ggplot(aes(start, id, colour = party)) +
  geom_point() +
  geom_segment(aes(xend = end, yend = id)) + #creates line segment with specified beginning and end
  scale_colour_manual(values = c(Republican = "red", Democratic = "blue")) #Uses predefined mapping between values and colors so Republican points are red and Democratic are blue. 



df <- tibble( #constructs data frame df
  x = rnorm(10000), #rnorm() generates random numbers in a normal distribution for x
  y = rnorm(10000) #does the same for y
)
ggplot(df, aes(x, y)) + #ggplot with global aesthetic mapping of x and y specifications
  geom_hex() + #Generates hexagonal map similar to geom_bin2d function
  coord_fixed() #plots with a fixed aspect ratio

ggplot(df, aes(x, y)) +
  geom_hex() +
  viridis::scale_fill_viridis() + #continuous analog of the categorical ColorBrewer scales and uses the fill aesthetic to fill each hexagon with the color
  coord_fixed() #plots with fixed aspect ratio



ggplot(df, aes(x, y)) +
  geom_hex() + #hexagonal mapping
  scale_colour_gradient(low = "white", high = "red") + #adds continuous color to create a gradient. Would need to use scale_fill_gradient2() if there is a diverging scale
  coord_fixed() #fixed aspect ratio



ggplot(diamonds, aes(carat, price)) + #ggplot with diamonds dataset with aesthetic mapping for variables carat and price
  geom_point(aes(colour = cut), alpha = 1/20) #color aesthetic for variable cut, points are semitransparent through alpha by a factor of 1/20



ggplot(mpg, mapping = aes(displ, hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth() +
  coord_cartesian(xlim = c(5, 7), ylim = c(10, 30)) #zooms in on a region of the plot according to the specified x limits and y limits

mpg %>% #mpg data frame
  filter(displ >= 5, displ <= 7, hwy >= 10, hwy <= 30) %>% #filter() shows cases in which the specified conditions are true. In this case it is between 5 and 7 for variable displ and between 10 and 30 for variable hwy
  ggplot(aes(displ, hwy)) +
  geom_point(aes(color = class)) + #scatterplot with color aesthetic for class variable
  geom_smooth() #new layer with smooth fitted line. Confidence interval around line is present because there is no command "se=FALSE"



suv <- mpg %>% filter(class == "suv") #Filters occurrences of suv from mpg and saves them into new data frame: suv
compact <- mpg %>% filter(class == "compact") #Filters occurences of compact from mpg and saves them into new data frame: compact

ggplot(suv, aes(displ, hwy, colour = drv)) + #ggplot for new data frame suv
  geom_point() #scatterplot for suv

ggplot(compact, aes(displ, hwy, colour = drv)) + #ggplot for new data frame compact
  geom_point() #scatterplot for compact
#2 separate plots for the two classes of cars, which are difficult to compare due to the differences in scales



x_scale <- scale_x_continuous(limits = range(mpg$displ)) #new scale for x with specified limits saved as x_scale
y_scale <- scale_y_continuous(limits = range(mpg$hwy)) #new scale for y with specified limits saved as y_scale
col_scale <- scale_colour_discrete(limits = unique(mpg$drv)) #new color scale with specified limits

ggplot(suv, aes(displ, hwy, colour = drv)) +
  geom_point() +
  x_scale +
  y_scale +
  col_scale #all new scales applied to suv ggplot

ggplot(compact, aes(displ, hwy, colour = drv)) +
  geom_point() +
  x_scale +
  y_scale +
  col_scale #all new scales applied to compact ggplot
#Now both plots have the same scales and are easier to compare



ggplot(mpg, aes(displ, hwy)) + #mpg ggplot
  geom_point(aes(color = class)) + #scatterplot layer with aesthetic mapping of color for variable class
  geom_smooth(se = FALSE) + #another layer with a smooth fitted line without the confidence interval
  theme_bw() #theme added to plot. theme_bw() is a white background with grid lines



ggplot(mpg, aes(displ, hwy)) + geom_point() #ggplot of mpg that has been used with a scatterplot of the specified variables displ (x) and hwy (y)



ggsave("my-plot.pdf") #ggsave() function saves the most recent plot to disk. No specifications of width and height for this code
#> Saving 7 x 4.33 in image
#fig.width controls width
#fig.height controls height of the figure
#fig.asp is the aspect ratio
#out.width and out.height are the output widths and heights of the figure respectively. They need to be adjusted with fig.width and fig.height
#fig.show="hold" shows plots after the code
#fig.cap adds a caption
#dev="png" sets the graphics type to png, making plots more compact



