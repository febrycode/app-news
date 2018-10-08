# App News

Simple App for News application system use Ruby on Rails

## Setup

First, install [Ruby on Rails](https://gorails.com/setup/ubuntu/16.04)

Then run the following commands under the `app-news` dir.

```
app-news $ ruby -v # confirm Ruby present
ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-darwin17]
app-news $ rails -v # confirm Rails present
Rails 5.2.1
app-news $ bundle install # install dependencies
...
...
Bundle complete! 16 Gemfile dependencies, 68 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.
app-news $ 

```

## Usage

1. Clone the repository or download and extract it.
2. Copy .env.example to .env by doing
```
app-news $ cp .env.example .env
```
3. Start by doing 
```
app-news $ rails db:create
app-news $ rails db:migrate
app-news $ rails s
```
4. To run spec test by doing
```
app-news $ bundle exec rspec spec/
```

## Assumptions

1. News can contains multiple topics
2. Topic has multiple news
3. To create news, create topic first and send topic id to form create news for link between news and topics