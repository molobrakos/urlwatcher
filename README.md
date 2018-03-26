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

Example rule (for keeping track of when Volvo releases new maps for the in-car navigation system):
```
name: Volvo
url: https://support.volvocars.com/se/cars/pages/downloads-area.aspx?csid=mca&cstype=map&cscount=3&mc=y413&my=2014&sw=13w46#mapdownloaddetails&5360bf009bafa20cf40b1589
filter: html | render | css('table#specs') | first | text | splitlines | slice(3) | list | tabulate
```

Resulting in output:

```
https://support.volvocars.com/se/cars/pages/downloads-area.aspx?csid=mca&cstype=map&cscount=3&mc=y413&my=2014&sw=13w46#mapdownloaddetails&5360bf009bafa20cf40b1589 is CHANGED since ever
--------------------------------------------------------------------------------
--- last fetch  (never)

+++ current     2018-03-26T11:30:18

@@ -0,0 +1,5 @@

+----------  ----------
+Publicerad  2017-09-29
+Utgåva      31676528
+CD-databas  MCA/17/09
+----------  ----------
```
