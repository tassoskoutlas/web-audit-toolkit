# Web audit toolkit for digital landscape analysis

The scripts on this repository help with website forensic when mapping the technical landscape of a company. Please use wisely and respect web master wishes as they are outlined in `robots.txt` files.

The method follows the notion of the five pillars of digital:

- Marketing
- Functionality
- Content
- Security & compliance
- Governance

## Installation

Grab the code from Github:

```
git clone git@github.com:tassoskoutlas/web-audit-toolkit.git && cd web-audit-toolkit
```

Install somewhere in your path (e.g. `~/bin`) like so:

```
cd ~/bin
ln -s ~/web-audit-toolkit/audit-content.sh .
ln -s ~/web-audit-toolkit/audit-links.sh .
```
Run your audits.

## Website forensics

Before you start any audit you need to read the contents of `robots.txt` and respect them:

```
wget https://example.com/robots.txt && cat robots.txt
```

Usage:

- Check if `crawl-delay` is present and take note of its value
- Use `crawl-delay` value when calling the scripts of this directory

Extract the canonical URL you need to be working with:

```
curl -I https://example.com
```

Usage:

- If not 200 then location header contains redirect link with the canonical URL

Understand request headers 

```
curl -I https://example.com
```

Usage:

- Provides info on cookies and headers that often lead to functionality

Perform content audit of website:

```
audit-content URL crawl_delay
```

Usage:

- Understand the amount of content a website holds
- Understand URL structure
- Find interesting files that may be open from the file system

List all links on a page:

```
audit-links.sh URL filename
```

Usage:

- Understand external links that are present on the webpage
- Find out domains linked
- Find out sub-domains that may control more

## Helpers

Grep with foo or bar:

```
grep -E 'foo|bar' file.txt
```

Exclude the pattern from grep:

```
grep -v 'expression' file.txt
```	

Remove whitelines from file

```
sed -i '/^$/d'
```

Delete line containing word "Hidden"

```
sed -i '/Hidden/d' temp
```

Delete all lines not starting with https (select all http and do not delete)

```
sed -i '/^https\?/!d' file.txt
```

Split a url and keep the domain only:

```
cat temp | cut -d '/' -f3
```

