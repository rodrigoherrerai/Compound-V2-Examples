# Compound V2 Examples


This repo demonstrates the most common interactions with Compound V2.

You can find the full explanation in this post: 
https://mirror.xyz/roherrera.eth/jS7oMZFxquX7pXNkRxBO9JFR0rxdoCbudKojjB9zzEs



## Installation

This repo uses [Foundry](https://github.com/foundry-rs/foundry), if you don't have it installed, go [here](https://book.getfoundry.sh/getting-started/installation) for instructions. 

Once you cloned the repo, be sure to be located at the root and run the following command:

```
forge install 
```

## Usage 

All the examples are located under the test folder. 

To test all of them just run the following command: 

```
forge test -vv
```
* An alchemy key is provided, you don't need to add anything. 

If you one to test a specific example run: 
```
forge test --match-path test/name-of-the-file -vv
```

