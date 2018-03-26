# Urlwatcher

- Monitor a list of URL:s for changes
- Uses Jinja2 templates for extracting (and transform) relevant portion of page
- Uses requests_html (https://github.com/kennethreitz/requests-html) to render the page before extracting data
- Suitable for use with crontab
- Inspired by https://github.com/thp/urlwatch

Example:
```
> ./urlwatcher 
http://www.google.com/search?q=current+time is CHANGED since 2018-03-26T11:19:32
--------------------------------------------------------------------------------
--- last fetch  2018-03-26T11:19:32

+++ current     2018-03-26T11:27:44

@@ -1 +1 @@

-11:19
+11:27
```

