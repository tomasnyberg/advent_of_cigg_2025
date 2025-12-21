# Advent of Cigg

This year, I decided I was going to absolutely smoke the competition. 🚬🚬

## Background

[Cigg](https://github.com/tomasnyberg/tomaslang) is a language that I wrote from scratch.
In order to prove that it actually works (and isn't just a prototype) I decided to solve all of this year's Advent of Code problems using it.
It is not the fastest language, and it obviously doesn't have luxuries such as an LSP or a debugger.
But it does have some fairly neat and concise syntax, allowing me to for instance parse the ranges on day 5 as follows:

```
let ranges = sort map (range => map int words "-" range) words "\n" parts[0];
```

### Language bugs
Solving AoC in a language that you yourself wrote is actually **twice** as fun as doing it in a normal language.
Now, if you encounter a bug while solving a problem, the bug could actually be in the language, not your code!

Some fun ones I encountered:

- Day 2: [I used i64 for my ranges, right?](https://github.com/tomasnyberg/tomaslang/commit/6c5e326727b561a655b2fc9fde21acee90a5849a)
- Day 2: [Break statements are simple. Surely I didn't forget to clean up the stack.](https://github.com/tomasnyberg/tomaslang/commit/d51545261e2cc83614f3381f8c947fd499862eb8)
- Day 3: [Call frames and lexical scopes are not the same thing. I knew that.](https://github.com/tomasnyberg/tomaslang/commit/96bfc1bfece68e8a0b4f75bf254e26bcaed1fa7d)

