# Y-Not -- Adventures in Functional Programming #

I recently gave a talk at the Cincinnati Functional Programming Users
Group on the Y-Combinator.  Though many have heard of the
Y-Combinator, few understand what it is for, let alone how it works.
This talk was an attempt to make the Y-Combinator accessible to your
average programmer.

We are going to build up to Y slowly, touching on several topics along
the way.  Our first diversion will be: Fixpoints.

## Fixpoints

Take out your average scientific calculator, make sure it is in
"radians" mode, enter a 0 and then start pressing the cos button over
and over.

      fix_point_of_cos = cos(cos(cos(cos( ... cos(0) ... ))))

If you do that long enough (about 100 times or so) you will notice
that the number returned converges to a value of 0.7390851332151605.
We call that converging value the fixpoint of the cosine function.

It turns out that fixpoints are really interesting mathematically. But
for us, just keep the idea of a fixpoint of a function in your head
for later.

## Higher Order Functions

Our next stop along the way to the Y-Combinator is higher order
functions.  If you are familiar with higher order functions, then you
can probably skip this section. If you are unsure what higher order
functions are and what to do with them, then pay close attention
here.  We will be using them heavily in the code to come.

Consider the following function:

      add1 = ->(n) { n + 1 }

Note that we are using Ruby for our example code.  Any language that
permits higher order functions is usable here.  This means Javascript,
Coffeescript, Python, Scheme, Clojure are all good choices here. I'm
use Ruby because the syntax is close enough to other common languages
that folks should be able to translate to their own favorite language
easily enough.

The "->(n) { n + 1 }" syntax is an anonymous function.  The "n" in
parenthesis is the formal arguments to the function.  The curly braces
(and their contents) is the function body.  The function will return
the last expression in the function.

Now lets use that function:

      add1.(5)       # => 6

This line invokes (calls) the function assigned to add1, which returns
a 6 (the "# =>" syntax indicates a comment on why this 

