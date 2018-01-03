## Turf Twitter 2017 analysis

This is an explanation of how I selected the accounts and obtained the data used in [my analysis](https://twitter.com/asianturfgrass/status/948203012324864000) of turfgrass accounts on Twitter. 

I explain what I did for these calculations here in plain language. The [code](https://github.com/micahwoods/turf_twitter_2017) gives the exact line by line description of data collection and filtering and calculation and ranking. My intention is very soon to post the calculated statistics on a searchable and sortable data table.

The data were obtained using the [`rtweet`](https://cran.rstudio.com/web/packages/rtweet/) package which I first read about in [this post at rud.is](https://rud.is/b/2017/10/22/a-call-to-tweets-blog-posts/). That was a great introduction, and I agree that [`rtweet`](https://cran.rstudio.com/web/packages/rtweet/) is a great way to work with Twitter data.

### Which accounts, or what is *Turf Twitter*?

My interest is turfgrass information, and I wanted to study accounts that are involved or have an interest in turfgrass information. I generally tweet about turfgrass information myself, but I know there are a lot of people out there interested in turf information who don't follow me -- I'm [@asianturfgrass](https://twitter.com/asianturfgrass), by the way.