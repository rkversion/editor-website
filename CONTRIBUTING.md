# How to Contribute

We'd love to accept your patches and contributions to this project. There are
just some guidelines you need to follow.

## Contributor License Agreement

Contributions to this project must be accompanied by a Contributor License
Agreement. You (or your employer) retain the copyright to your contribution;
this simply gives us permission to use and redistribute your contributions as
part of the project. Head over to <https://cla.developers.google.com/> to see
your current agreements on file or to sign a new one.

You generally only need to submit a CLA once, so if you've already submitted one
(even if it was for a different project), you probably don't need to do it
again.

## Code Reviews

All submissions, including submissions by project members, require review. We
use GitHub pull requests for this purpose. Consult
[GitHub Help](https://help.github.com/articles/about-pull-requests/) for more
information on using pull requests.

## Community Guidelines

This project follows [Google's Open Source Community
Guidelines](https://opensource.google/conduct/).

We also follow the guidelines of the original project for consistency.

## Useful Links

* https://www.ruby-lang.org/ - The homepage of Ruby which has more links and some great tutorials.
* http://rubyonrails.org/ - The homepage of Rails, also has links and tutorials

## Coding Style

We use [Rubocop](https://github.com/rubocop-hq/rubocop) (for ruby files)
and [ERB Lint](https://github.com/Shopify/erb-lint) (for erb templates)
to help maintain consistency in our code. You can run these utilities during
development to check that your code matches our guidelines:

```
bundle exec rubocop
bundle exec rake eslint
bundle exec erblint .
```

## Testing

Having a good suite of tests is very important to the stability and
maintainability of any code base. The tests in the Rails port code are
by no means complete, but they are extensive, and must continue to be
so with any new functionality which is written. Tests are also useful
in giving others confidence in the code you've written, and can
greatly speed up the process of merging in new code.

When hacking, you should:

* Write new tests to cover the new functionality you've added.
* Where appropriate, modify existing tests to reflect new or changed
functionality.
* Never comment out or remove a test just because it doesn't pass.

You can run the existing test suite with:

```
bundle exec rake test
```

## Comments

Sometimes it's not apparent from the code itself what it does, or,
more importantly, **why** it does that. Good comments help your fellow
developers to read the code and satisfy themselves that it's doing the
right thing.

When hacking, you should:

* Comment your code - don't go overboard, but explain the bits which
might be difficult to understand what the code does, why it does it
and why it should be the way it is.
* Check existing comments to ensure that they are not misleading.


## Committing

When you submit patches, the project maintainer has to read them and
understand them. This is difficult enough at the best of times, and
misunderstanding patches can lead to them being more difficult to
merge. To help with this, when submitting you should:

* Split up large patches into smaller units of functionality.
* Keep your commit messages relevant to the changes in each individual
unit.

When writing commit messages please try and stick to the same style as
other commits, namely:

* A one line summary, starting with a capital and with no full stop.
* A blank line.
* Full description, as proper sentences with capitals and full stops.

For simple commits the one line summary is often enough and the body
of the commit message can be left out.

## Sending the Patches

If you have forked on GitHub then the best way to submit your patches is to
push your changes back to GitHub and then send a "pull request" on GitHub.

