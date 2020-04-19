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

Outcome:

- Check if `crawl-delay` is present and take note of its value
- Use `crawl-delay` value when calling the scripts of this directory

Extract the canonical URL you need to be working with:

```
curl -I https://example.com
```

Outcome:

- If not 200 then location header contains redirect link with the canonical URL

Understand request headers 

```
curl -I https://example.com
```

Outcome:

- Provides info on cookies and headers that often lead to functionality

Perform content audit of website:

```
audit-content URL crawl_delay
```

Outcome:

- Understand the amount of content a website holds
- Understand URL structure
- Find interesting files that may be open from the file system

Cross reference content in Google:

```
site:example.com
```

Outcome:

- Get number of indexed pages from Google

Find out how often a website publishes. Use the inbuild date range tools that Google provides in relation to the following query:

```
site:example.com
```

Outcome:

- Understand content update frequency
- Gives insights into how big the digital team may be
- Gives insights into which web assets are more important

List all links on a page:

```
audit-links.sh URL filename
```

Outcome:

- Understand external links that are present on the webpage
- Find out domains linked
- Find out sub-domains that may control more

Find out backlinks (can be combined with date range):

```
link:example.com -site:example.com
```

Outcomes:

- Understand affiliate sites
- Understand other sites of the same group

Explore all sudbomains for a given site (excluding www):

```
site:*.example.com -www
```

Outcome:

- Understand other websites that are maintained

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

