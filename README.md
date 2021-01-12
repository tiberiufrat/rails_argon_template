# Rails Argon Template
**This is a ruby on rails template featuring the Argon dashboard theme.** It's our rails template, it has almost everything. From beautiful layout to production ready setup and javascript components. It is adapted after lazaronixon's [The Construct](https://github.com/lazaronixon/the_construct) template.

## Getting started
```
$ git clone https://github.com/tiberiufrat/rails_argon_template
$ rails new my_rails_app -d=postgresql --webpack=stimulus -m ~/projects/rails_argon_template/template.rb
```

## Features
* Argon dashboard template
* FontAwesome 5 icons
* [TurboLinks](https://github.com/turbolinks/turbolinks)
* [Stimulus](https://github.com/stimulusjs/stimulus)
* [Scaffolds](https://guides.rubyonrails.org/command_line.html#rails-generate)
* [Heroku Ready](https://heroku.com)
* [Hybrid Mobile Architecture Ready](https://m.signalvnoise.com/basecamp-3-for-ios-hybrid-architecture)
* [DHH development practices](https://www.youtube.com/channel/UCdx5Dk3EWTe2i8YDA7bfl6g)
* [ScreenCast](https://www.youtube.com/watch?v=_p0S0Ll7o78)

### Argon template
The construct integrates the Argon template with modern rails ecosystem tools like Webpack, Turbolinks and Stimulus JS, bringing a sophisticated implementation and maximum performance without SPA hassle.

### Scaffolds
The construct replaces default scaffold template with a new one focused on production. Some features are:
* Sortable and filterable with datatables.net
* [Infinite scroll pagination](https://github.com/basecamp/geared_pagination)
* [Exportable data](https://github.com/westonganger/spreadsheet_architect)
* [Input masks](https://demo.getstisla.com/forms-advanced-form.html)
* [Select with autocomplete on references fields](https://demo.getstisla.com/forms-advanced-form.html)
* [Toastr plugin to show flash messages](https://demo.getstisla.com/modules-toastr.html)
* [HTML5 client side validation integration](https://demo.getstisla.com/forms-validation.html)
* Ajax form post with turbolinks handlers
* API and WEB share controllers
* Self generated system tests

### Heroku Ready
The construct comes with some opinionated configurations and addons that should be on any production application like:
* [Heroku Redis](https://elements.heroku.com/addons/heroku-redis) for data store and caching.
* [PaperTrail](https://elements.heroku.com/addons/papertrail) or any other for logging.
* [SendGrid](https://elements.heroku.com/addons/sendgrid) for email delivery.
* [RackRatelimit](https://github.com/jeremy/rack-ratelimit) for blocking & throttling abusive requests.
* AssetHost configured to ENV['CLOUDFRONT_URL'].
* Sidekiq as queue adapter.
* Force SSL.

### Hybrid Mobile Architecture Ready
The construct is a [Majestic Monolith](https://m.signalvnoise.com/the-majestic-monolith) template so it is full compatible with [TurboLinks IOS](https://github.com/turbolinks/turbolinks-ios), [TurboLinks Android](https://github.com/turbolinks/turbolinks-android) or [React Native TurboLinks](https://github.com/lazaronixon/react-native-turbolinks). After create a new project you can easily port it to a IOS/Android APP.

### Requirements
Rails ~> 6.0.0
