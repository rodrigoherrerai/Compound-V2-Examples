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

To test a specific example run: 
```
forge test --match-path test/name-of-the-file -vv
```

## Examples 

All examples are done by forking Mainnet.

### 1. Upgrade Comptroller 

Location: test/UpgradeComptroller.t.sol 

This examples goes through the entire Compound's governance lifecycle. 

The goal is to upgrade the Comptroller singleton. In order to do that we: 

1 Get 400k COMP tokens
2 Create the proposal 
3 Vote in our favour 
4 Execute the proposal 


### 2. Supply & Redeem

Location: test/SupplyAndRedeem.t.sol 

Basic example of how to supply a token to Compound and then redeem it plus earned interests. 


### 3. Borrow & Repay 

Location: test/BorrowAndRepay.t.sol 

Basic example of how to borrow a token from Compound and then repay the debt.

