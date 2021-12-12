library(tidyverse) __#loads the core tidyverse package, which helps access datasets, help pages, and functions__  
── Attaching packages ─────────────────────────────────────── tidyverse 1.3.0 ── __#list of packages loaded in with tidyverse__  
✔ ggplot2 3.3.2     ✔ purrr   0.3.4  
✔ tibble  3.0.3     ✔ dplyr   1.0.2  
✔ tidyr   1.1.2     ✔ stringr 1.4.0  
✔ readr   1.4.0     ✔ forcats 0.5.0  
── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ── __#lists of any functions that might conflict with packages already loaded in R__  
✖ dplyr::filter() masks stats::filter()  
✖ dplyr::lag()    masks stats::lag()  


install.packages("tidyverse") __#code to install tidyverse packages if not already installed. It only needs to be run once per session__  
library(tidyverse) __#now it can load tidyverse__  



mpg __#loads a specific type of data frame from ggplot2. We can see here it has a rectangular set of variables (columns) and observations (rows). The loaded mpg dataset has observations from the US Environmental Protection Agency on 38 models of cars. The following rows listed show each observation within the dataset.__   
# A tibble: 234 x 11  
manufacturer model displ  year   cyl trans      drv     cty   hwy fl    class   
<chr>        <chr> <dbl> <int> <int> <chr>      <chr> <int> <int> <chr> <chr>   
  1 audi         a4      1.8  1999     4 auto(l5)   f        18    29 p     compa…  
2 audi         a4      1.8  1999     4 manual(m5) f        21    29 p     compa…  
3 audi         a4      2    2008     4 manual(m6) f        20    31 p     compa…  
4 audi         a4      2    2008     4 auto(av)   f        21    30 p     compa…  
5 audi         a4      2.8  1999     6 auto(l5)   f        16    26 p     compa…  
6 audi         a4      2.8  1999     6 manual(m5) f        18    26 p     compa…  
# … with 228 more rows  



ggplot(data = mpg) + __#Creates a plot of the dataset mpg. This first line specifically creates an empty graph with the data argument as mpg.__   
geom_point(mapping = aes(x = displ, y = hwy)) __#The geom_point function adds a layer of points to the plot, creating a scatterplot. Mapping specifies that within the plot the variable displ will be on the x-axis and the variable hwy will be on the y-axis__  



ggplot(data = <DATA>) + __#Allows the code to become a reusable template for making grpahs through ggplot. Any of the bracketed sections can be replaced with actual data, geom-function, or mappings depending on the necessary template.__  
<GEOM_FUNCTION>(mapping = aes(<MAPPINGS>)) __#Same function of making a template with the specified geom_function and mappings__  



ggplot(data = mpg) + __#mpg plot__  
geom_point(mapping = aes(x = displ, y = hwy, color = class)) __#Maps the points on the plot with the specified axes like before, this time mapping the colors of the points to the class variable, which shows each class as a different color to visualize the distribution of class on the plot. The aes() funciton maps an aesthetic to a variable and assigns a level of the aesthetic to each variable value, which is called scaling. ggplot also provides a legend in the graph.__  



ggplot(data = mpg) + __#mpg plot__  
geom_point(mapping = aes(x = displ, y = hwy, size = class)) __#This performs the same function as the earlier r chunk but this time instead of color the aesthetic assigned is size. Each type of class is assigned a different point size, and a legend is provided.__   
Warning: Using size for a discrete variable is not advised. __#Warning that using size to map and visualize an unordered variable is a bad idea.__   



Left plot  
ggplot(data = mpg) +   
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class)) __#Mapping class with the alpha aesthetic, which adjusts the transparency of points based on their class using the scaling process.__  

Right plot  
ggplot(data = mpg) +   
  geom_point(mapping = aes(x = displ, y = hwy, shape = class)) __#Mapping class with the shape aesthetic, which assigns a different shape as the point for each class value through scaling. Using the aes() function gathers each mapping from the layers and passes them tot he layer's mapping argument. The function associates the specific aesthetic with the variable it is meant to display.__   



ggplot(data = mpg) +   
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue") __#Sets the aesthetic properties of the geom_point manually, here making all of the plot points blue. This just changes the plot's appearance. It doesn't convey information about the plot. When setting the aesthetic manually it has to be coded outside of the aes() function. There are codes for different levels that can be used for setting the aesthetic.__   



ggplot(data = mpg) +   
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue")) __#This code demonstrates what happens when the aesthetic is not coded properly and is instead inside the aes() function. On the plot the points are not blue, but are labeled blue. This code allows ggplot to pick a random color aesthetic for which each point is categorized in the variable "blue."__  



ggplot(data = mpg)  
+ geom_point(mapping = aes(x = displ, y = hwy)) __#Faulty code in which the "+" was put at the beginning instead of the end of the line, which will produce an error message. If the error is unclear, the problem can be solved by getting help with the ?function_name command.__  



ggplot(data = mpg) +   
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2) __#This line facets the plot, which displays one subset of the data. Here the use of "~ class" means that the plot is being faceted by one variable (class). The variable used in the facet_wrap() function needs to be discrete. Nrow=2 specifies that the plot should contain 2 rows.__  



ggplot(data = mpg) +  
  geom_point(mapping = aes(x = displ, y = hwy)) +  
  facet_grid(drv ~ cyl) __#This causes the plot to be faceted by 2 variables, which are separated by the ~. One of the two variables could also be replaced by a period to avoid faceting in the rows or columns dimension.__  



ggplot(data = mpg) + __#empty graph for plotting mpg dataset__  
geom_point(mapping = aes(x = drv, y = cyl)) __#Adding the layer of points to the plot with an aesthetic applied to the variables drv and cyl. Since the aesthetic was not specified, ggplot will apply whichever aesthetic makes sense for the data. Also maps drv onto the x-axis and cyl onto the y-axis.__  



ggplot(data = mpg) +  
  geom_point(mapping = aes(x = displ, y = hwy)) + __#Maps the same plot as earlier__  
facet_grid(drv ~ .) __#Now a facet is applied, which displays drv, but does not facet cyl__  

ggplot(data = mpg) +  
  geom_point(mapping = aes(x = displ, y = hwy)) +  
  facet_grid(. ~ cyl) __#The opposite is the case here so cyl is faceted but drv is not. Using this r chunk we get to see both faceted separately.__  



ggplot(data = mpg) +  
  geom_point(mapping = aes(x = displ, y = hwy)) + __#Same plot that has been used__  
facet_wrap(~ class, nrow = 2) __#This line facets the plot, which displays one subset of the data. Here the use of "~ class" means that the plot is being faceted by one variable (class). The variable used in the facet_wrap() function needs to be discrete. Nrow=2 specifies that the plot should contain 2 rows.__  



left plot  
ggplot(data = mpg) +  
  geom_point(mapping = aes(x = displ, y = hwy)) __#This code uses the point geom to create a normal scatterplot of the data. This maps the same plot as was used earlier with the variable displ on the x-axis and hwy on the y-axis.__

right plot  
ggplot(data = mpg) +  
  geom_smooth(mapping = aes(x = displ, y = hwy)) __#This code uses the smooth geom, which generates a smooth line fitted to the data.__ 



ggplot(data = mpg) +  
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv)) __#Uses the geom_smooth function to generate a smooth line fitted to the data. Also includes the drv variable being mapped to linetype. So there will be a different line and linetype for each value of the variable set too linetype (in this case, the variable drv).__



ggplot(data = mpg) +  
  geom_smooth(mapping = aes(x = displ, y = hwy)) __#This code uses the smooth geom, which generates a smooth line fitted to the data.__  

ggplot(data = mpg) +  
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv)) __#Uses the geom_smooth function to generate a smooth line fitted to the data. Also includes the group aesthetic to drv, a categorical variable, to draw multiple objects. ggplot2 draws a separate object for each unique value of the grouping variable.__  

ggplot(data = mpg) +  
  geom_smooth( __#Uses the geom_smooth function to generate a smooth line fitted to the data.__  
              mapping = aes(x = displ, y = hwy, color = drv),  
              show.legend = FALSE  
  )  __#Codes the color aesthetic to drv, a categorical variable, so that ggplot2 assigns a separate color for each unique value of the variable drv.__



ggplot(data = mpg) +  
  geom_point(mapping = aes(x = displ, y = hwy)) +  
  geom_smooth(mapping = aes(x = displ, y = hwy)) __#Displays multiple geoms in the same plot by adding multiple geom functions to the same ggpplot__



ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + __#This mapping function treats the set of mappings written here as global mappings that apply to each geom in the graph__  
geom_point() + __#Produces scatterplot__  
geom_smooth() __#Produces smooth line fitted to the data__



ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + __#Mappings placed within the ggplot function are treated as global__ 
geom_point(mapping = aes(color = class)) + __#Mappings placed within the geom function are treated as local for that specific layer, so that different aesthetics can be displayed in different layers. In this case the color aesthetic only applies to the scatterplot layer based on the class variable__  
geom_smooth()



ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + __#Mappings placed within the ggplot function are treated as global__  
geom_point(mapping = aes(color = class)) +  __#Mappings placed within the geom function are treated as local for that specific layer, so that different aesthetics can be displayed in different layers. In this case the color aesthetic only applies to the scatterplot layer based on the class variable__  
geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE) __#Different data is being specified in the smooth geom. The line displays the new specified category of class "subcompact." This only applies for this layer. se = FALSE means confidence interval is not shown around the line.__



ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + __lobal mapping with the colors of the points depending on the drv variable.__  
geom_point() +  
  geom_smooth(se = FALSE) __#se argument shows the confidence interval around the line when applied to geom_smooth. When set to =FALSE it does not show this interval.__



ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + __#This mapping function treats the set of mappings written here as global mappings that apply to each geom in the graph__  
geom_point() + __#scatterplot__  
geom_smooth() __#smooth line to fit data__  

ggplot() +#ggplot does not have global mappings  
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) +    
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy)) __#Here both geoms will display on the same plot. You would want to use a different code in the case that you want the axes to display different variables__



ggplot(data = diamonds) + #dataset used for ggplot now is diamonds  
  geom_bar(mapping = aes(x = cut)) __eom function used here creates a bar chart. The variable specified via mapping and the aesthetic is the cut, displayed on the x-axis. The y-axes not specified in the code is automatically set to display the frequency (or count) at which each cut category appears in the data. The program uses a stat to do this.__  



ggplot(data = diamonds) + __#dataset used for ggplot now is diamonds__  
stat_count(mapping = aes(x = cut)) __#This code creates the same plot as before, just using stat_count. This works because stat_count was the default stat for geom_bar.__



demo <- tribble(  
  ~cut,         ~freq,  
  "Fair",       1610,  
  "Good",       4906,  
  "Very Good",  12082,  
  "Premium",    13791,  
  "Ideal",      21551  
) __#Used to override default stat by packing the frequency of the cut categories into a vector called demo. Takes into account the frequency of each category listed under the cut variable.__  

ggplot(data = demo) + __#New ggplot using new vector demo as the dataset__  
geom_bar(mapping = aes(x = cut, y = freq), stat = "identity") __#New bar chart mapping cut categories on the x-axis and their frequency on the y-axis.__   



ggplot(data = diamonds) + __gplot with diamonds as dataset__  
geom_bar(mapping = aes(x = cut, y = stat(prop), group = 1)) __#Bar chart with overriden default mapping from the transformed variables to aesthetics. The y-axis has been set to display a statistical transformation (stat) of proportion rather than count. The group=1 function specifies which row will be evaluated with the proportion.__


ggplot(data = diamonds) +  
  stat_summary( __#summarizes the y values for each unique x value__  
               mapping = aes(x = cut, y = depth), __#aesthetic mapping of the x and y axes__  
               fun.min = min, __#supplies the function minimum of the vector__  
               fun.max = max, __#Supplies the function maximum of the vector__  
               fun = median __#Supplies the function median of the vector__
  )  



ggplot(data = diamonds) +  
  geom_bar(mapping = aes(x = cut, y = after_stat(prop))) __#Bar chart with overriden default mapping from the transformed variables to aesthetics. The y-axis has been set to display a statistical transformation (stat) of proportion rather than count. Does not include group=1 so the proportion will end up being the whole dataset compared with the whole dataset (100).__ 
ggplot(data = diamonds) +  
  geom_bar(mapping = aes(x = cut, fill = color, y = after_stat(prop))) __#Same issue as previous bar chart, but includes the command fill=color so the bars will have color.__ 



ggplot(data = diamonds) +  
  geom_bar(mapping = aes(x = cut, colour = cut)) __#bar chart with color command so that each bin for the variable cut has its own outline__  
ggplot(data = diamonds) +  
  geom_bar(mapping = aes(x = cut, fill = cut)) __#bar chart with fill command that fills each bar for the variable cut with its own color__



ggplot(data = diamonds) +  
  geom_bar(mapping = aes(x = cut, fill = clarity)) __#bar chart with fill aesthetic applied to new variable, clarity so that each colored rectangle represents a combination of the two variables cut and clarity. The bars are stacked automatically.__ 



ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) + 
  geom_bar(alpha = 1/5, position = "identity") __#position="identity" places the objects exactly where they fall in the graph, which causes overlaps of the bars. The alpha adjustment makes the bars slightly transparent.__ 
ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) + 
  geom_bar(fill = NA, position = "identity") __#position="identity" places the objects exactly where they fall in the graph, which causes overlaps of the bars. fill=NA makes the bars completely transparent.__ 



ggplot(data = diamonds) +  
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill") __#position="fill" command stacks the bars, but makes each set of bars the same height, making comparison easier.__ 



ggplot(data = diamonds) +  
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge") __#position="dodge" puts overlapping objects beside each other.__ 



ggplot(data = mpg) +  
  geom_point(mapping = aes(x = displ, y = hwy), position = "jitter") __#position="jitter" function adds a small amount of random noise to each point, which spreads points out because no two points are likely to receive the same amount of random noise.__ 



ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + __#ggplot with mpg dataset. There is global mapping with cty as the x-axis and hwy as the y-axis__
geom_point() __#scatterplot of the dataset with the global mapping of the axes__



ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + __#ggplot with mpg dataset. There is global mapping with class as the x-axis and hwy as the y-axis__
geom_boxplot()
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + __#ggplot with mpg dataset. There is global mapping with class as the x-axis and hwy as the y-axis__
geom_boxplot() + __#creates boxplot of data__
coord_flip() __#switches the x and y axes of the plot, which can help with issues of overlapping.__ 



nz <- map_data("nz") __#saves map_data into a new vector "nz"__

ggplot(nz, aes(long, lat, group = group)) + __#map plot of nz with latitude (y-axis) and longitude (x-axis)__
geom_polygon(fill = "white", colour = "black") __#polygon plot filled in white, outlined in black__

ggplot(nz, aes(long, lat, group = group)) + __#map plot of nz with latitude (y-axis) and longitude (x-axis)__
geom_polygon(fill = "white", colour = "black") +
  coord_quickmap() __#sets the aspect ratio correctly for maps, so the plotted map is not warped__



bar <- ggplot(data = diamonds) + __#saves chunk of code into a bar vector__
geom_bar( eom command for a bar chart
          mapping = aes(x = cut, fill = cut), __#maps variable cut along the x axis, fills cut bars with color__
          show.legend = FALSE, __#no legend with the plot__
          width = 1 __#width of the plot set to 1__
) + 
  theme(aspect.ratio = 1) + __#modify theme based on aspect ratio to equal one, making the plot a square__
labs(x = NULL, y = NULL) __#No labels on either axes__

bar + coord_flip() __#switches the y-axis with the x-axis for the bar__
bar + coord_polar() __#uses polar coordinates to create a pie chart__



ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + __#ggplot with mpg dataset. There is global mapping with cty as the x-axis and hwy as the y-axis__
geom_point() + __#scatterplot__
geom_abline() + __#Reference line added to plot__
coord_fixed() __#Plot with fixed aspect ratio__



__Helpful code template for applying the functions described in the chapter. It includes seven parameters. Can be used to build any plot.__   
ggplot(data = <DATA>) + )) __#empty graph for plotting dataset__  
<GEOM_FUNCTION>( __geom function to plot actual layer__  
                mapping = aes(<MAPPINGS>), __#aesthetic mapping of variables__  
                stat = <STAT>, __#statistical transformation of plot__  
                position = <POSITION> __#position adjustment__
) +  
  <COORDINATE_FUNCTION> + __#coordinate system of plot that can be adjusted__  
<FACET_FUNCTION> __#Split plot into facets to display subsets of the data__  


### Graphics for Communication  


library(tidyverse) __#Run the package tidyverse in the library__



ggplot(mpg, aes(displ, hwy)) + __#empty graph for plotting dataset__  
geom_point(aes(color = class)) + __#scatterplot with color aesthetic applied to the variable class__  
geom_smooth(se = FALSE) + __#adds a smooth fitted line. se=FALSE removes the confidence interval around the line__  
labs(title = "Fuel efficiency generally decreases with engine size") __#Creates a label for the title of the plot, which summarises the main finding__  



ggplot(mpg, aes(displ, hwy)) + __#same plot as above__  
geom_point(aes(color = class)) +  
  geom_smooth(se = FALSE) +  
  labs(  
    title = "Fuel efficiency generally decreases with engine size", __#main title label above the plot__
    subtitle = "Two seaters (sports cars) are an exception because of their light weight", __#subtitle for additional detail in a smaller font under the title__  
    caption = "Data from fueleconomy.gov" __#caption adds text at the bottom right of the plot, which can be used to display the data source__
  )



ggplot(mpg, aes(displ, hwy)) + __#same plot__  
geom_point(aes(colour = class)) +  
  geom_smooth(se = FALSE) +  
  labs(  
    x = "Engine displacement (L)", __#replaces x-axis label__
    y = "Highway fuel economy (mpg)", __#replaces y-axis label__
    colour = "Car type" __#renames the legend title__
  )



df <- tibble( __#constructs a data frame named df__  
             x = runif(10), __#Generates 10 random numbers for x__  
             y = runif(10) __#Generates 10 random numbers for y__
)

ggplot(df, aes(x, y)) +  
  geom_point() +  
  labs(
    x = quote(sum(x[i] ^ 2, i == 1, n)), __#quote() function allows a mathematical equation to be used as a label for the x-axis (instead of a string of text)__  
    y = quote(alpha + beta + frac(delta, theta)) __#mathematical equation used as y-axis label__
  )



best_in_class <- mpg %>% __#uses tibble to pull out specific information__
group_by(class) %>% __#specification of the variable from which the information is to be extracted__
filter(row_number(desc(hwy)) == 1) __#filters one point by row for the variable__

ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(colour = class)) + __#scatterplot__
geom_text(aes(label = model), data = best_in_class) __#Geom_text like geom_point, but you can add labels to the actual plot. Labels the points specified using the tibble function.__



ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(colour = class)) + __#normal scatterplot from before__
geom_label(aes(label = model), data = best_in_class, nudge_y = 2, alpha = 0.5) __#Geom_label draws a rectangle behind the text, making it easier to read. label=model specifies what is to be labeled. nudge_y moves labels above the points by a factor of 2. alpha function makes the labels semi transparent by 0.5.__



ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(colour = class)) + __#scatterplot mapped with color aesthetic for class__
geom_point(size = 3, shape = 1, data = best_in_class) + __#New scatterplot layer with size and shape specifications for the points, which highlight the best_in_class points with a circle around them__
ggrepel::geom_label_repel(aes(label = model), data = best_in_class) __#ggrepel function automatically adjusts labels so they do not overlap__



class_avg <- mpg %>% __#new data frame for class_avg to be specified__
group_by(class) %>%
  summarise( __#new data frame for labeling__  
            displ = median(displ), __#computes median of x__  
            hwy = median(hwy) __#computes median of y__
  )  
`summarise()` ungrouping output (override with `.groups` argument)

ggplot(mpg, aes(displ, hwy, colour = class)) +
  ggrepel::geom_label_repel(aes(label = class), __#ggrepel to keep labels from overlapping. Aesthetic mapping to label class__
                            data = class_avg, __#data labeled is class average__
                            size = 6, __#plot size adjustment__
                            label.size = 0, __#label size adjustment__
                            segment.color = NA __#no specified segment color__
  ) +
  geom_point() + __#new scatterplot layer__ 
theme(legend.position = "none") __#turns the legend off__



label <- mpg %>% __#new data frame__
summarise( __#summarise() computes specific values of x and y__
          displ = max(displ), __#computes maximum x value__
          hwy = max(hwy), __#computes maximum y value__
          label = "Increasing engine size is \nrelated to decreasing fuel economy." __#label for the new plot put in the upper right corner of the data frame. '\n' breaks label into lines__
)

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_text(aes(label = label), data = label, vjust = "top", hjust = "right") __#scatterplot with specified label to be at upper right corner of the plot. vjust and hjust control the alignment of the label. They have nine combinations total__



label <- tibble( __#tibble creates new data frame__
                displ = Inf, __#Inf function puts label at the border fo the plot__
                hwy = Inf, __#label at the border of the plot__
                label = "Increasing engine size is \nrelated to decreasing fuel economy." __#label that will be written. '\n' command breaks the label into lines__
)

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_text(aes(label = label), data = label, vjust = "top", hjust = "right") __#label for plot at upper right corner now at the borders of the plot due to Inf command__



"Increasing engine size is related to decreasing fuel economy." %>%
  stringr::str_wrap(width = 40) %>% __#automatically adds line breaks based on specification of characters you want per line (in this case a maximum of 40)__
writeLines() __#specification of the lines to be written__
Increasing engine size is related to
decreasing fuel economy.



ggplot(mpg, aes(displ, hwy)) + __#empty ggplot graph__
geom_point(aes(colour = class)) __#scatterplot layer with aesthetic color for variable class__



ggplot(mpg, aes(displ, hwy)) +  
  geom_point(aes(colour = class)) +  
  scale_x_continuous() + __#x scale__  
scale_y_continuous() + __#y scale__  
scale_colour_discrete() __#default scales added by ggplot to each plot created (Format: scale_name of aesthetic_ name of scale dependent on the type of variable they align with)__



ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  scale_y_continuous(breaks = seq(15, 40, by = 5)) __#breaks function overrides default choice to adjust the appearance of the ticks on the axes__



ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  scale_x_continuous(labels = NULL) + __#labels=NULL suppresses the labels on the tick marks along the axes. Here for the x-axis__
scale_y_continuous(labels = NULL) __#same for the y-axis__



presidential %>% __#New dataset presidential__
mutate(id = 33 + row_number()) %>% __#mutate() adds new variable without dropping existing ones__
ggplot(aes(start, id)) +
  geom_point() + __#scatterplot layer__
geom_segment(aes(xend = end, yend = id)) + __#geom_segment creates line segments. Draws a line between x/y and xend/yend__
scale_x_date(NULL, breaks = presidential$start, date_labels = "'%y") __#adjusts ticks on axes to highlight where observations occur, requires format specification__



base <- ggplot(mpg, aes(displ, hwy)) + __#ggplot saved as new vector "base"__
geom_point(aes(colour = class)) __#scatterplot included in base__

base + theme(legend.position = "left") __#adjusts legend position to the left of the plot "base"__
base + theme(legend.position = "top") __#legend position above the plot__
base + theme(legend.position = "bottom") __#legend position below the plot__
base + theme(legend.position = "right") # the default __#default to have legend to the right of the plot__



ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(colour = class)) +
  geom_smooth(se = FALSE) +
  theme(legend.position = "bottom") + __#puts legend at the bottom of the plot__
guides(colour = guide_legend(nrow = 1, override.aes = list(size = 4))) __#Guides() controls the display of individual legends. guide_legend function shows control over the number of rows in the legend (nrow=) and overrides the original aesthetic to make the points larger (override.aes=list(size=)).__ 
`geom_smooth()` using method = 'loess' and formula 'y ~ x'



ggplot(diamonds, aes(carat, price)) + __#unstransformed variables__
geom_bin2d()

ggplot(diamonds, aes(log10(carat), log10(price))) + __#log transform of variables carat and price from the original plot part of aesthetic mapping))
geom_bin2d() __#geom_bin2d divides plot into rectangles, then counts the number of cases in each rectangle and maps the number of cases to the rectangle's fill. Helpful for when scatterplot is overplotted.__ 



ggplot(diamonds, aes(carat, price)) +
  geom_bin2d() + 
  scale_x_log10() + __#x-axis adjusted to log scale__
scale_y_log10() __#y-axis adjusted to log scale. Makes plot easier to read__



ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(color = drv)) __#original scatterplot with default colors__

ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(color = drv)) +
  scale_colour_brewer(palette = "Set1") __#colors on scatterplot adjusted to be distinguishable by people with red-green color blindness__



ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(color = drv, shape = drv)) + __#includes shape differences between the categories within the variable, making the graph interpretable in black and white__
scale_colour_brewer(palette = "Set1") __#red-green color blind adjustment__



presidential %>% __#presidential dataset__
mutate(id = 33 + row_number()) %>% __#adds variable__
ggplot(aes(start, id, colour = party)) +
  geom_point() +
  geom_segment(aes(xend = end, yend = id)) + __#creates line segment with specified beginning and end__
scale_colour_manual(values = c(Republican = "red", Democratic = "blue")) __#Uses predefined mapping between values and colors so Republican points are red and Democratic are blue.__ 



df <- tibble( __#constructs data frame df)__
             x = rnorm(10000), __#rnorm() generates random numbers in a normal distribution for x__
             y = rnorm(10000) __#does the same for y__
)
ggplot(df, aes(x, y)) + __#ggplot with global aesthetic mapping of x and y specifications__
geom_hex() + __#generates hexagonal map similar to geom_bin2d function__
coord_fixed() __#plots with a fixed aspect ratio__

ggplot(df, aes(x, y)) +
  geom_hex() +
  viridis::scale_fill_viridis() + __#continuous analog of the categorical ColorBrewer scales and uses the fill aesthetic to fill each hexagon with the color__
coord_fixed() __#plots with fixed aspect ratio__



ggplot(df, aes(x, y)) +
  geom_hex() + __#hexagonal mapping__
scale_colour_gradient(low = "white", high = "red") + __#adds continuous color to create a gradient. Would need to use scale_fill_gradient2() if there is a diverging scale__
coord_fixed() __#fixed aspect ratio__



ggplot(diamonds, aes(carat, price)) + __#ggplot with diamonds dataset with aesthetic mapping for variables carat and price__
geom_point(aes(colour = cut), alpha = 1/20) __#color aesthetic for variable cut, points are semitransparent through alpha by a factor of 1/20__



ggplot(mpg, mapping = aes(displ, hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth() +
  coord_cartesian(xlim = c(5, 7), ylim = c(10, 30)) __#zooms in on a region of the plot according to the specified x limits and y limits__

mpg %>% __#mpg data frame__
filter(displ >= 5, displ <= 7, hwy >= 10, hwy <= 30) %>% __#filter() shows cases in which the specified conditions are true. In this case it is between 5 and 7 for variable displ and between 10 and 30 for variable hwy__
ggplot(aes(displ, hwy)) +
  geom_point(aes(color = class)) + __#scatterplot with color aesthetic for class variable__
geom_smooth() __#new layer with smooth fitted line. Confidence interval around line is present because there is no command "se=FALSE"__



suv <- mpg %>% filter(class == "suv") __#Filters occurrences of suv from mpg and saves them into new data frame: suv__
compact <- mpg %>% filter(class == "compact") __#Filters occurrences of compact from mpg and saves them into new data frame: compact__

ggplot(suv, aes(displ, hwy, colour = drv)) + __#ggplot for new data frame suv__
geom_point() __#scatterplot for suv__

ggplot(compact, aes(displ, hwy, colour = drv)) + __#ggplot for new data frame compact__
geom_point() __#scatterplot for compact__
__#2 separate plots for the two classes of cars, which are difficult to compare due to the differences in scales__



x_scale <- scale_x_continuous(limits = range(mpg$displ)) __#new scale for x with specified limits saved as x_scale__
y_scale <- scale_y_continuous(limits = range(mpg$hwy)) __#new scale for y with specified limits saved as y_scale__
col_scale <- scale_colour_discrete(limits = unique(mpg$drv)) __#new color scale with specified limits__

ggplot(suv, aes(displ, hwy, colour = drv)) +
  geom_point() +
  x_scale +
  y_scale +
  col_scale __#all new scales applied to suv ggplot__

ggplot(compact, aes(displ, hwy, colour = drv)) +
  geom_point() +
  x_scale +
  y_scale +
  col_scale __#all new scales applied to compact ggplot__
__#Now both plots have the same scales and are easier to compare__



ggplot(mpg, aes(displ, hwy)) + __#mpg ggplot__
geom_point(aes(color = class)) + __#scatterplot layer with aesthetic mapping of color for variable class__
geom_smooth(se = FALSE) + __#another layer with a smooth fitted line without the confidence interval__
theme_bw() __#theme added to plot. theme_bw() is a white background with grid lines__



ggplot(mpg, aes(displ, hwy)) + geom_point() __#ggplot of mpg that has been used with a scatterplot of the specified variables displ (x) and hwy (y)__



ggsave("my-plot.pdf") __#ggsave() function saves the most recent plot to disk. No specifications of width and height for this code__
#> Saving 7 x 4.33 in image  
__#fig.width controls width__  
__#fig.height controls height of the figure__  
__#fig.asp is the aspect ratio__  
__#out.width and out.height are the output widths and heights of the figure respectively. They need to be adjusted with fig.width and        fig.height__  
__#fig.show="hold" shows plots after the code__  
__#fig.cap adds a caption__  
__#dev="png" sets the graphics type to png, making plots more compact__


