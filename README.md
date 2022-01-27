# 🔑🔑 DiffieHellman [![](https://img.shields.io/apm/l/vim-mode)](https://github.com/Red-company/RES_Implementation/blob/main/LICENSE.md)

![plot](./Screenshots/DiffieHellman_test1.png)

## What is it?

This is an implementation of _DiifieHellman_ key exchange _protocol_ that works with _very long inegers_(19.729 chars long, can work with bigger ones, look at the screenshot that is placed above this text or below). You also can find an _example file(main.cpp)_ at this repository with it's description. <br/>

Advanced DiffieHellman is [_here_.](https://github.com/vladimirrogozin/2layerDiffieHellman)<br/>
It is also a part of [_RedLibrary_](https://github.com/Red-company/RedLibrary).

## How it works?

The simpliest way to describe how it works is to _draw_ that, so, I did that, here it is:

```
  _____     _____
 /     \   /     \
|   m   | |   m   | - 1 Step. We have the same values at the beginning.
 \_____/   \_____/
    |         |
  __|__     __|__
 /     \   /     \
|  m+a  | |  m+b  | - 2 Step. We're mixing them with our secret keys.
 \_____/   \_____/
    |         |
  __|__     __|__
 /     \   /     \
|   ma  | |   mb  | - 3 Step. We got mixed keys.
 \_____/| |\_____/
        \ / 
  _____  X  _____
 /     \/ \/     \
|   mb  | |   mb  | - 4 Step. We're exchanging them.
 \_____/   \_____/
    |         |
  __|__     __|__
 /     \   /     \
| mb+a  | | ma+b  | - 5 Step. Mixing again with secret keys.
 \_____/   \_____/
    |         |
  __|__     __|__
 /     \   /     \
|  mab  | |  mab  | - 6 Step. We got the same keys.
 \_____/   \_____/
```

So, you have successfully traced the _'fingered-edition'_ _DiffieHellman_, but we're here for something much more difficult and interesting, you're here for education, not for code, doesn't it? ;) <br/><br/>

I'm _joking_, it's 'safed' by _MIT Licence_, it's fully your's. <br/><br/>

Let's get back to the _funny math_. Let's describe it by steps I _drew before_:

* 1.)   It's like _0 position_, needn't to describe it. Just getting a _'Prime number'_, base number(it's named _'g'_) and getting some random keys.
```C
P = -1; // Just getting the max value.
g = 3;  // Base number, in fact, it's better to use 2.
```
Yeah, we're working with exponent, because it's _'easy'_ to calculate it but it's difficult to get sqrt from that.
* 2.-3.) We're calculating our public keys with the following formulas:
```C
A = g**a mod P // For Alice.
B = g**b mod P // For Bob.
```

* 4.) Next, we're exchanging them, and the crucial thing in DiffieHellman is that you're exchanging something, that it's impossible to calculate sqrt from(or at least _toooooooooo difficult_, as difficult that _useless_):
```C
Est. chance of getting the one we need = lim[x->0]
```

* 5.-6.) We're using our secret key again to get _synced keypair_, and yeah, exponent again:
```C
S1 = B**a mod P // For Alice.
S2 = A**b mod P // For Bob.

S1 = S2
```

_Congratulations! We did that!_ Now, you understand how it works, don't you want to see some examples? Look at the screenshots below.<br/>

![plot](./Screenshots/DiffieHellman_test2.png)

![plot](./Screenshots/DiffieHellman_test3.png)

## Where to use?

As you could understand, it can be used everywhere you need a secure channel(_server-client applications_ for example), literally everywhere.

## Any tests? Okay:

Tested on Macbook Air with i5. <br/><br/>

So, for spending about 200 seconds to calculate(haha, ya, 200), you have these settings:

| Alice's secret | Bob's secret | G | P | Time(seconds) |
|----------------|--------------|---|---|---------------|
| 7.000.000 | 103 | 2 | have't used | 197,268 |
| 7.000.000 | 52 | 4 | have't used | 199,839 |
| 7.000.000 | 34 | 8 | have't used | 196,951 |
| 7.000.000 | 25 | 16 | have't used | 221,794 |
| 7.000.000 | 20 | 32 | have't used | 193,420 |

<br/>

Or another test - about 60 seconds:

| Alice's secret | Bob's secret | G | P | Time(seconds) |
|----------------|--------------|---|---|---------------|
| 3.000.000 | 145 | 2 | have't used | 59,770 |
| 3.200.000 | 3 | 3 | have't used | 57,992 |
| 3.000.000 | 72 | 4 | have't used | 59,241 |
| 2.200.000 | 3 | 5 | have't used | 57,804 |

<br/>

Or the one you want to see: <br/>

|               Task                | Time(seconds) |
|-----------------------------------|---------------|
| 2 ** 3.005.400.000 (not using _P_) | haven't calculated sorry, but it works |

So, if you want to use any of these nums, you have to calculate ~time you would like to spend(paper math, yo), and, of course, use the _sqrt(Akey * Bkey)_ as a range of _rand()_ or _Red::Randomizer()_ in your application(_+2!!!!_ Of course, bcs, that's the way to _make DH possible_).

## How to make a channel in client-server application?

Good question, not difficult in fact:

* 1.) We're getting the same keys.(Full _DiffieHellman_)
* 2.) Now, we have the same keys. We need to get an encrypted channel, how to do that? My answers are here: <br/>
** 1.) [_AES standard_](https://github.com/vladimirrogozin/AES_Implementation). <br/>
** 2.) [_RES standard (mine one)_](https://github.com/Red-company/RES_Implementation). <br/>
You can use _DH_ shared key as a key or to make it x2 longer with [_my simple encryption algorithm(Va1)_](https://github.com/vladimirrogozin/Va1) and after that use the result to get a hashed sum, or to get a hash, and _cut/expand_ it to the length you need([_Sha256_](https://github.com/vladimirrogozin/Sha256)).

##
**Notes:**
 * _P_ number (_prime one_) works stable with ~197.290 characters long (From _'RedTypes.h'_: _'Red::uint524288_t'_).
 * Needs to understand that the _time of calculation rises as the secret key value rises_.
 * If you use any of integer types that _sizes as 2048 and more_, it will take a _HUGE AMOUNT OF TIME_ to calculate, use those only for _specific tasks_. 
 * _Secret key_ is restricted by uint max size in power function(function from boost is used there).

##
All material in this repository is in the public domain.
