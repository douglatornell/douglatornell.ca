"""Filter stdin to stdout, injecting OpenId link tags after a <head> tag.

Intended use is `add_openid.py < index.html > index.html`.

This is a work-around the fact that there doesn't seem to be a way to
get rst2html.py to add the necessary link tags in the <head> section.

"""
import sys

for line in sys.stdin.readlines():
    sys.stdout.write(line)
    if line.strip() == '<head>':
        sys.stdout.write("""\
<link rel="openid2.provider" href="https://www.google.com/accounts/o8/ud?source=profiles" />
<link rel="openid2.local_id" href="http://www.google.com/profiles/djlatornell" />
""")
