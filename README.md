# Smart Contract Proposal
By: Anthony Chen

## Update December 08 2020
I've finished the project, the .sol files are in this repository. The contract is deployed in the Ropsten Testnet at 0x323e1Bc604d93eeaB4536198a3b2C2E8044b496c. It stores and provides information about games (I've limited it to 3 right now as this is a proof of concept). Unfortunately, because I can't figure out how to initialize arrays of structs (both google and the compiler told me that it was a feature that has yet to be inplemented), I've resorted to arrays. Just remember your index and you can find out the name, rating, reviews, and so on about the game in the index. 

GameName = Game name
Rating = Overall rating (total wei collected from people writing reviews)
GameReview = Most appropriate (read:sucker who paid the most) review
ReviewRating = Review helpfulness (read:how much wei the suck paid), pay more wei than this to get your review regarded as most helpful for the game 

Award functionality has been added, just like bad car commercials where they use made-up awards to look better, I too can make up awards and whoever pays a full ether or more can have the award. Because I'm a responsible person, only one Game of the Year award can be given, even though it was trivial to add the possibility of more.

Testing has also been done, it is the ReviewScam_test.sol file. I tried following Remix's instructions, and tested in Remix. I've also tested everything in the test network.

## Idea

I was inspired when browsing reddit, where I found a post in a gaming subreddit urging fans to go to a specific website to rate their game five stars. The clickbait website was obviously just trying to make money by appealing to die-hard fans.

So I asked myself, why can't I do the same thing, but instead of a website I just use a smart contract? Just have people pay in crypto for the privilege of rating their beloved game and pocket all their money.

## How it's going to work
1. First, the user submits their review and rating with a small payment to the smart contract
2. Then, the smart contract (me) pockets the money (if I'm doing this for real)'
3. The review and rating is stored and average rating for the game computed.
4. Next, If the user rates the game highly, the user get a message telling them that their game is the highest rated and is obviously a person of fine taste. If the user rates it poorly, the user gets a message telling them that they're courageous for standing up to the astroturfing/marketing campaign of the absolutely terrible game.
    - If they rate their game highly but there is a game with a higher average rating, return a message that while their game was good, there is a higher rated game, and provide one of the higher rated game's reviews
5. Attempt to get stir up a war between fans of different games or get an angry mob to review bomb a bad game to get more users.
6. Loob back to step 1. Profit.
