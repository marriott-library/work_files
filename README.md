# WorkFiles
WorkFiles is a gem to make programmatic file attachment and CRUD operations
in Hyrax easier — both for primary repository files and derivatives.  This
simplifies both ingest and programmatic introspection of file attachments to
repository assets in Hyrax-based repositories, and abstracts many complicated
aspects of native Hyrax calling interfaces for dealing with attachment
and access of attached files.

## Who benefits from this gem?

* Developers building repository applications or solutions with Hyrax.
* Integrators responsible for creating ingest of file materials into any
  Hyrax-based repository.

## Installation and Usage
Add dependency of 'work_files' in the gemspec of your Hyrax-based app or engine,
and run `bundle install`.

Some initial rough console usage documentation is available via this narrative
[gist](https://gist.github.com/seanupton/6983fc74e002ea8b3160f6687b8633e3).

## Credits

This gem's functionality was originally developed as part of 
[NewspaperWorks](https://github.com/marriott-library/newspaper_works),
a project of the "Newspapers in Samvera" project, an
[IMLS](https://imls.gov)-funded collaboration
between the [University of Utah](https://www.utah.edu)'s
[J. Willard Marriott Library](https://www.lib.utah.edu/)
and the [Boston Public Library](https://www.bpl.org/).

### Authors and maintainers

* [Sean Upton](https://github.com/seanupton)

## License
The gem is available as open source under the terms of the
[Apache 2.0 License](https://www.apache.org/licenses/LICENSE-2.0)

![Institute of Museum and Library Services Logo](https://imls.gov/sites/default/files/logo.png)
![University of Utah Logo](http://www.utah.edu/_images/imagine_u.png)
![Boston Public Library Logo](https://cor-liv-cdn-static.bibliocommons.com/images/MA-BOSTON-BRANCH/logo.png?1528788420451)
