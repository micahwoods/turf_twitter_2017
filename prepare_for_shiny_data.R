# after running all the scripts, get key data into one file
# for showing in Shiny

for_shiny <- select(order_composite2, screen_name, profile_image_url,
                    all_around, all_around_rank, rt_h_index, rt_rank,
                    fav_h_index, fav_rank, tweet_creation_rate, tcr_rank,
                    sum_mentions, sum_mentions_rank, followers_count, follower_rank)

# d <- read.csv("~/Documents/Rs/turf_twitter_2017_shiny/for_shiny.csv",
#              header = TRUE)



# ok, how can I format the profile_image_url?
# how about straight up paste?
for_shiny$profile2 <- paste0("<img src=\"", for_shiny$profile_image_url, 
                     "\" height = \"40\"></img>")

d <- for_shiny[, c(1, 15, 3:14)]

d$tweet_creation_rate <- as.numeric(prettyNum(d$tweet_creation_rate, digits = 2))

colnames(d) <- c("screen_name", " ", "All_Around",
                 "Rank", "Retweet_H-index", "Rank",
                 "Favorite_H-index", "Rank", "TCR", "TCR_Rank",
                 "Mentions", "Mentions_Rank", "Followers", "Followers_Rank")

write.csv(d, "~/Documents/Rs/turf_twitter_2017_shiny/for_shiny.csv",
                   row.names = FALSE)
