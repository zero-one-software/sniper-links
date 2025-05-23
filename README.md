# SniperLinks

This gem helps with creating sniper links for various email platforms.

Sniper links are links that can be supplied to your users, to help them find emails from you more easily.

You can read more about [Sniper Links in this post](https://growth.design/sniper-link).

* [Installation](#installation)
* [Usage](#usage)
  * [Using a strategy directly](#using-a-strategy-directly)
* [Supported Platforms](#supported-platforms)
  * [Sniper link strategy functionality](#sniper-link-strategy-functionality)
* [Development](#development)
* [Contributing](#contributing)
  * [Feature wishlist](#feature-wishlist)
* [License](#license)
* [Code of Conduct](#code-of-conduct)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sniper_links'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install sniper_links

## Usage

```ruby
email = "marlon.rando@gmail.com"
from  = "us@our.domain"

snipe = SniperLinks.new(email) # => SniperLinks
snipe.sniper_link_strategy     # => SniperLinks::Strategies::GMail
snipe.sniper_link(from)        # => URI

puts snipe.sniper_link.to_s
# => https://mail.google.com/mail/u/0/#search/from%3A%28us%40our.domain%29%2Bin%3Aanywhere%2Bnewer_than%3A1h
```

### Using a strategy directly

If you want to use a strategy directly, you can do so like so:

```ruby
email = "rando.calrissian@foo.com"
from  = "us@our.domain"

snipe = SniperLinks.new(email) # This will raise an error
# Traceback (most recent call last):
# ....
# SniperLinks::Error (Unsupported email domain)

snipe = SniperLinks::Strategies::GMail.new(email) # => SniperLinks::Strategies::GMail
snipe.sniper_link(from)                           # => URI
```

## Supported Platforms

We support the following email service provider platforms:

* Gmail - `*@gmail.com`
* Outlook - `*@outlook.com`
* Yahoo - `*@yahoo.*` or `*@myyahoo.*`
* ProtonMail - `*@protonmail.com`, `*@proton.me`, `*@protonmail.ch`, or `*@pm.me`
* iCloud - `*@icloud.com`, `*@me.com`, or `*@mac.com`

### Sniper link strategy functionality

Each email service provider has its own sniper link strategy. The following table shows how much functionality is supported by each provider.

|              | Gmail | Outlook | Yahoo | Protonmail | iCloud |
|--------------|-------|---------|-------|------------|--------|
| Link         |  ✔️   |  ✔️     |  ✔️  |     ✔️     |   ✔️   |
| Account      |  ✔️   |  ✔️     |  ✖️  |     ✖️️     |   ✖️   |
| From filter  |  ✔️   |  ✖️️️️     |  ✔️  |     ✔️     |   ✖️   |
| Spam piercer |  ✔️   |  ✖️️️️     |  ✔️  |     ✔️     |   ✖️   |
| Time filter  |  ✔️   |  ✖️️️️     |  ✔️  |     ✔️     |   ✖️   |

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/zero-one-software/sniper-links. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/zero-one-software/sniper-links/blob/master/CODE_OF_CONDUCT.md).

### Feature wishlist

* Add support for more email service providers, like Hey.com, Fastmail, etc.
* Add support for selecting a strategy based on the email address domain's MX records.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SniperLinks project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/zero-one-software/sniper-links/blob/master/CODE_OF_CONDUCT.md).
