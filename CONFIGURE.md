# Configuration

After [installing](INSTALL.md) this software, you may need to carry out some of these configuration steps, depending on your tasks.

## Application configuration

Many settings are available in `config/settings.yml`. You can customize your installation of The Rails Port by overriding these values using `config/settings.local.yml`

## Populating the database

Your installation comes with no geographic data loaded. You can either create new data using one of the editors (iD, etc) or by loading an extract.


## Managing Users

If you create a user by signing up to your local website, you need to confirm the user before you can log in, which normally happens by clicking a link sent via email. If don't want to set up your development box to send emails to public email addresses then you can create the user as normal and then confirm it manually through the Rails console:

```
$ bundle exec rails console
>> user = User.find_by_display_name("My New User Name")
=> #[ ... ]
>> user.status = "active"
=> "active"
>> user.save!
=> true
>> quit
```

### Giving Administrator/Moderator Permissions

To give administrator or moderator permissions:

```
$ bundle exec rails console
>> user = User.find_by_display_name("My New User Name")
=> #[ ... ]
>> user.roles.create(:role => "administrator", :granter_id => user.id)
=> #[ ... ]
>> user.roles.create(:role => "moderator", :granter_id => user.id)
=> #[ ... ]
>> user.save!
=> true
>> quit
```

## Troubleshooting

Rails has its own log.  To inspect the log, do this:

```
tail -f log/development.log
```


## Maintaining your installation

If your installation stops working for some reason:

* Sometimes gem dependencies change. To update go to your rails_port directory and run ''bundle install'' as root.

* The OSM database schema is changed periodically and you need to keep up with these improvements. Go to your rails_port directory and run:

```
bundle exec rake db:migrate
```


# Contributing

For information on contributing changes to the codes, see [CONTRIBUTING.md](CONTRIBUTING.md)

# Production Deployment

If you want to deploy The Rails Port for production use, you'll need to make a few changes.

* It's not recommended to use `rails server` in production. Our recommended approach is to use [Phusion Passenger](https://www.phusionpassenger.com/). Instructions are available for [setting it up with most web servers](https://www.phusionpassenger.com/documentation_and_support#documentation).
* Passenger will, by design, use the Production environment and therefore the production database - make sure it contains the appropriate data and user accounts.
* Your production database will also need the extensions and functions installed - see [INSTALL.md](INSTALL.md)
* The included version of the map call is quite slow and eats a lot of memory. You should consider using [CGIMap](https://github.com/zerebubuth/openstreetmap-cgimap) instead.
* Make sure you generate the i18n files and precompile the production assets: `RAILS_ENV=production rake i18n:js:export assets:precompile`
* Make sure the web server user as well as the rails user can read, write and create directories in `tmp/`.
