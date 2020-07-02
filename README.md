# TwitterBot

  Ruby based twitter bot to auto reply, post twitters from a file and
  autopublish trending topics
​
## Built With
​
- Ruby 2.6.5
​- Twitter gem
​- Yml gem


## Installation
​
  To get a local copy up and running follow these simple example steps.

  Clone the project using the next command:
  `​git clone https://github.com/AdfPizarro/twitterbot`

  Install all the dependencies with the command
  `​bundle install`

  You will need a Twitter developer account, to get the api Key
  you can get an account here

  `https://developer.twitter.com/en/dashboard`

  Once you have your api key, you will need to create a .env file with the
  following promoted_content

  export CONSUMER_KEY='YOUR_CONSUMER_KEY'
  export CONSUMER_SECRET='YOUR_CONSUMER_SECRET'
  export ACCESS_TOKEN='YOUR_ACCESS_TOKEN'
  export ACCESS_TOKEN_SECRET='YOUR_ACCESS_TOKEN_SECRET'

  Now everything is ready, but don't run it yet, check the instructions
​

### Instructions


  By default the boot will take the trending topic and publish
  what do you think about "current topic" every hour (60 min)

  And publish a tweet from the `lib/journal.yml` file every 2 hours (120 min)

  You can modify this by changing the values in the config.env files, the time
  is in minutes
  `export TRENDING_PUBLISH=120`
  `export JOURNAL_PUBLISH=240`

  You may also want to edit the predefined tweets in the journal by editing
  the `lib/journal.yml` file

  ![screenshot](./screenshot/ss2.png)

  The boot will check for mentions every minute and auto reply them
  based on the intent of the tweet, this intents can be



  greet if any word in the tweet match with a word in the `lib/greet.yml`

  help if any word in the tweet match with a word in the `lib/help.yml`

  meme if any word in the tweet match with a word in the `lib/meme.yml`

  empty if the mention is empty

  Fell free to modify this files to add or remove words

  Tweets

  To not reply twice a tweet the bot will save the mentions in the `lib/meme.yml`
  file


  Run it

  To run the bot you only need to type in the console
  `ruby main.rb`

  ![screenshot](./screenshot/ss1.png)


## Commands

  Note: You need to do `bundle install` before executing the commands above.

  To run the lints
  `​rubocop`​

​# Unit test (rspec)

  If you want to modify any module be sure to run the unit tests with the command

  `​rspec --format documentation`​
​
## Authors
​
👤 **Adrian Flores Pizarro**
​
- Github: [@AdfPizarro](https://github.com/AdfPizarro)
- Twitter: [@AdfPizarro](https://twitter.com/adfpizarro)
- Linkedin: [adrian-flores-pizarro-73b62316a](https://www.linkedin.com/in/adrian-flores-pizarro-73b62316a/)
​

## �� Contributing
​
Contributions, issues and feature requests are welcome!
​
Feel free to check the [issues page](issues/).
​
## Show your support
​
Give a ⭐️ if you like this project!
​

## �� License
​
This project is [MIT](lic.url) licensed.
