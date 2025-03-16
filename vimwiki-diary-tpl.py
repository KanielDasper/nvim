#!/usr/bin/env python3

from datetime import date

today = date.today()
d1 = today.strftime("%Y-%m-%d")

template = f"""# {d1}
Back to [Diary Index](Diary)

## Notes

## Todo

* [ ]
"""

print(template)
