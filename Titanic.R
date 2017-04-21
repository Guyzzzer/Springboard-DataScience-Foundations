#This is an explanation of my code for the last exercise of the __First Part of DataCamp's ggplot2 Tutorial__
##In this mini exercise we are given a dataset pertaining to the Titanic, and are tasked with creating a few visual plots to better
##understand the data. First thing's first we have to take a look at our data set thus:
str(titanic)
##This shows us that there are four simple columns, age which uses integers, sex which is either "male" or "female" in characters, survived
##which is shown as a 0 or 1, and the passenger's ticket class which are integers from 1-3, for first to third class tickets.
##An initial observation that we can make is that we're not told expressly if 0 or 1 indicates that a passenger survived or not, although
##hopefully later when we graph the 0 vs 1 we'll be able to make an assumption based on ticket class, since we know from the previous springboard
##Data Wrangling exercise that most of the deaths came from those with lower ticket classes, quite unfairly. 

## The first graph DataCamp asks us to make is a bar graph which uses the ticket class for the x-axis, the default (count) for the y-axis,
## and the sex as a factor for the bar colour fill. Also they ask us to set the bars side by side instead of stacked, as per the default.
##The ticket class and factor, both integers and character values, have to be made factors for the aesthetics function, and to set the bars
##side by side we set the position argument as "dodge" within the geom_bar layer. This makes it easy to look at the gender distribution through
##ticket classes.
ggplot(titanic, aes(x=factor(Pclass), fill=factor(Sex)))+geom_bar(position="dodge") 

##For the second graph we're told to make the same graph, but to instead make two of them based on the 0 or 1 for who survived.
##In this case we repeat the above line of code, keeping the dodge position, and add a facet_grid layer indicating the survived column
##as the separation. Admittedly I had no idea what this did until I followed the instructions for this part.
# Use ggplot() for the second instruction
ggplot(titanic, aes(x=factor(Pclass), fill=factor(Sex)))+geom_bar(position="dodge")+facet_grid(". ~ Survived")

##After looking at this plot I believe it's safe to say that 0 indicates those who didn't make it, and 1 indicates those who did, as there's
##a lot more counts for the 3rd class passengers in the 0 column, and vice versa. We can also observe that a lot more women made it than the
##men. Thus we can conclude chivalry was not yet dead when the Titanic sank, at least among it's passengers.
##The next part in the code is changing the plot from a bar plot to a scatter plot. They also ask us to set a jitter, as well as some
##specified dimensions for the alpha, and size attributes of the geom_jitter, and to include the age of passengers for the y-axis. Personally,
##I thought that including age for the y-axis lowered our ability of determining the counts of passengers in each position, although it did
##provide a diverse attribute for each passenger, allowing us to distinguish between the younger and older passengers.

## This specific position jitter was already given to us and assigned to posn.j for use in the geom_jitter layer
posn.j <- position_jitter(0.5, 0)
##Using this object we simply add Age to the y-axis in the aesthetics layer, change the geom_bar and facet_grid to a geom_jitter layer,
##and then specify the size, alpha, and jittered position. Although I previously stated it was unfair that many more of the third class
##passengers died relative to the others, it is sort of logical if you account for the fact that there was simply a lot more passengers
##in the third class than any other. With a much larger population it makes sense that much more of them will not make it - again it could
##also have been a class issue.
ggplot(titanic, aes(x=factor(Pclass), y=Age, col=factor(Sex)))+geom_jitter(size=3, alpha=0.5, position=posn.j)
##There we go, three new plots for our collection, two "dodgy" bar plots and a scatter plot!