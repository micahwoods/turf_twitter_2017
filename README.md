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

Then I 
