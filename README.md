# Advent of Cigg

This year, I decided I was going to smoke the competition. 🚬🚬

## Context

[Cigg](https://github.com/tomasnyberg/tomaslang) is a language that I wrote from scratch.
To prove that it is (slightly) more than a prototype, I decided to solve all of this year's [Advent of Code](https://adventofcode.com/) problems using it.


It is not the fastest language, and it obviously does not offer luxuries such as a debugger or an LSP.
But it does have some fairly neat and convenient syntax, as illustrated by this snippet from the day 5 solution:

```
let ranges = sort map (range => map int words "-" range) words "\n" parts[0];
```

## Language bugs
Solving AoC in a language that you wrote yourself is actually twice as much fun as doing it in a normal language.
Now, if you encounter a bug while solving a problem, the bug could actually be in the language, not your code!

Here are some of the fun bugs I encountered, along with the commits that fixed them:

- Day 2: I used i64 for my ranges, right? [fix](https://github.com/tomasnyberg/tomaslang/commit/6c5e326727b561a655b2fc9fde21acee90a5849a)
- Day 2: Break statements are simple. Surely I didn't forget to clean up the stack. [fix](https://github.com/tomasnyberg/tomaslang/commit/d51545261e2cc83614f3381f8c947fd499862eb8)
- Day 3: Call frames and lexical scopes are not the same thing. I knew that. [fix](https://github.com/tomasnyberg/tomaslang/commit/96bfc1bfece68e8a0b4f75bf254e26bcaed1fa7d)
- Day 6: Why is my brand new empty string not empty? [fix](https://github.com/tomasnyberg/tomaslang/commit/67831505439849c75bc4562e204105f865ab619f)

## Running the solutions
You can run the solutions using the steps outlined below.


I have not included the scripts as git-tracked files since I do not want GitHub to label the repo with another language.
It would be embarrassing to claim that I solved all problems using my own language, only for GitHub to display "Python: 100%".

### 1. Download inputs
First, get your `AOC_SESSION` token from chrome devtools and export it:
```
export AOC_SESSION=a53....
```
Then, run this Python code to download your personal inputs:
```python
from aocd import get_data
import os
import time

if not os.path.exists('inputs'):
    os.makedirs('inputs')

for day in range(1, 13):
    if not os.path.exists(f'inputs/day{day}.in'):
        with open(f'inputs/day{day}.in', 'w') as f:
            # avoid rate limit and be a good citizen :)
            time.sleep(1)
            f.write(get_data(day=day, year=2025))
            print(f"Day {day} input saved.")
```
### 2. Install Cigg
Install Cigg by following the instructions in the [language repository](https://github.com/tomasnyberg/tomaslang).

### 3. Run and benchmark all the solutions
Finally, you can run all the solutions using the following (obviously Claude-generated) script:
```
#!/bin/sh
set -eu
total=0
for i in 1 2 3 4 5 6 7 8 9 10 11 12; do
  echo "== $i.cigg =="
  t=$(
    /usr/bin/time -p cigg "$i.cigg" 2>&1 1>&3 3>&- \
      | awk '/^real /{print $2}'
  ) 3>&1
  echo "Time: ${t}s"
  total=$(awk -v a="$total" -v b="$t" 'BEGIN{printf "%.2f", a+b}')
done
echo ""
echo "total $total"
```
