## Turf Twitter 2017 analysis

This is an explanation of how I selected the accounts and obtained the data used in [my analysis](https://twitter.com/asianturfgrass/status/948203012324864000) of turfgrass accounts on Twitter. 

I explain what I did for these calculations here in plain language. The [code](https://github.com/micahwoods/turf_twitter_2017) gives the exact line by line description of data collection and filtering and calculation and ranking. My intention is very soon to post the calculated statistics on a searchable and sortable data table.

The data were obtained using the [`rtweet`](https://cran.rstudio.com/web/packages/rtweet/) package which I first read about in [this post at rud.is](https://rud.is/b/2017/10/22/a-call-to-tweets-blog-posts/). That was a great introduction, and I agree that [`rtweet`](https://cran.rstudio.com/web/packages/rtweet/) is a great way to work with Twitter data.

### Which accounts did I look at, or what is *Turf Twitter*?

My interest is turfgrass information, and I wanted to study accounts that are involved or have an interest in turfgrass information. I generally tweet about turfgrass information myself, but I wanted to look at more than the accounts that followed me -- I'm [@asianturfgrass](https://twitter.com/asianturfgrass), by the way.

I used the `get_followers` function to obtain followers from these accounts:

```r
# get id of accounts following 
atc <- get_followers("asianturfgrass", n = 20000, retryonratelimit = TRUE)
pace <- get_followers("paceturf", n = 20000, retryonratelimit = TRUE)
unl <- get_followers("unlturf", n = 20000, retryonratelimit = TRUE)
tomy <- get_followers("striturf_tomy", n = 20000, retryonratelimit = TRUE)
jyri <- get_followers("Amplify_Turf", n = 20000, retryonratelimit = TRUE)
jk <- get_followers("iTweetTurf", n = 20000, retryonratelimit = TRUE)
unruh <- get_followers("jbunruh", n = 20000, retryonratelimit = TRUE)

# get accounts following industry organizations, which I'll use as a confirmation
# that the account is probably interested in turf
gcsaa <- get_followers("gcsaa", n = 20000, retryonratelimit = TRUE)
bigga <- get_followers("BIGGAltd", n = 20000, retryonratelimit = TRUE)
canada <- get_followers("GolfSupers", n = 20000, retryonratelimit = TRUE)
agcsa <- get_followers("AGCSA2", n = 20000, retryonratelimit = TRUE)
iog <- get_followers("the_iog", n = 20000, retryonratelimit = TRUE)
stma <- get_followers("FieldExperts", n = 20000, retryonratelimit = TRUE)
```
Then I selected the unique accounts that followed at least one of the turf scientists and at least one of the industry organizations.

Next, I selected only the accounts that were set to public and that had more than 50 tweets.

```r
# this removes the private accounts, also the least active ones
turf_follower2 <- subset(turf_follower, protected == FALSE & statuses_count >= 50)
```

And I made one more cut, to remove the accounts that were following more than 10,000 accounts themselves. Those accounts tend to be bot-like and none were turf-related.

Now I had the list of 6,271 Twitter accounts to work with. Each of these, as of 31 Dec 2017 Bangkok time was following me or one of the other turf scientists listed above, and was also following one of the industry organizations, the account was set to public, the account had sent 50 or more tweets or retweets in its lifetime, and the account itself was following less than 10,000 other accounts.

### Getting the Tweets from each account for 2017

I looped through these accounts one by one, getting a maximum of 3,000 tweets from each account, selecting only those sent in 2017, and storing those tweets in a file.

```r
# at this point, it is 6271 accounts
# I want to loop through these, getting the tweets and making some calculations
# I'm fine with 3000

turf_timelines <- data.frame()

for (i in 1:6271) {
  new_timeline <- get_timeline(as.character(turf_follower3[i, 3]), n = 3000,
                               check = TRUE)
  new_timeline_2017 <- subset(new_timeline,
                              created_at >= "2017-01-01" &
                                created_at <= "2017-12-31")
  turf_timelines <- rbind(turf_timelines, new_timeline_2017)
  print(paste("completed", i, "/6271 accounts"))
  Sys.sleep(10) # probably not required because of check = TRUE, I wasn't in a hurry so 
  # I slowed it down a bit
}
```

With the exception of a couple accounts that block me, this got tweets from all 6,721 accounts that sent tweets in 2017.




