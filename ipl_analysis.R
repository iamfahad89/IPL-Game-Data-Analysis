ipl_analysis <- read.csv(file.choose(), header = T)
ipl = ipl_analysis


# 1.Does then team winning the toss wins the match as well?
summary(ipl)

by(ipl$Toss_Winner, ipl$match_winner, summary)

result <- all.equal.character(ipl$Toss_Winner, ipl$match_winner)
result
#end of first question



# 2. Can the home team have higher chances of winning the match 
#    when compared to the away team?
by(ipl$Venue_Home_Team, ipl$match_winner, summary)

trimws(ipl$Venue_Home_Team)
trimws(ipl$match_winner)
all.equal(ipl$Venue_Home_Team, ipl$match_winner)

identical(ipl$Venue_Home_Team, ipl$match_winner)
all.equal.factor(ipl$Venue_Home_Team, ipl$match_winner)
#end of second question




# 3. Can the team winning most of the tosses in the season help them 
#    to win the season also?
summary(ipl)
CrossTable(ipl$Toss_Winner, ipl$Season_Winner)


ggplot(ipl, aes(x = Season_Winner, fill = Toss_Winner)) + geom_bar()
#end of third question
