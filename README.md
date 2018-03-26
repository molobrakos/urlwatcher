# Urlwatcher

- Monitor a list of URL:s for changes
- Uses Jinja2 templates for extracting (and transform) relevant portion of page
- Uses requests_html (https://github.com/kennethreitz/requests-html) to render the page before extracting data
- Suitable for use with crontab
- Inspired by https://github.com/thp/urlwatch
