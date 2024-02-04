# Foundry Fund Me F23

This is a repository for Foundry Fund Me F23.

## Repository Information

- **Stars:** 31
- **Forks:** 43
- **Languages:** Solidity (92.1%), Makefile (7.9%)

## Getting Started

### Requirements

- [Git](https://git-scm.com/)
  - You'll know you did it right if you can run `git --version` and you see a response like `git version x.x.x`
- [Foundry](https://foundry.example.com/)
  - You'll know you did it right if you can run `forge --version` and you see a response like `forge 0.2.0 (816e00b 2023-03-16T00:05:26.396218Z)`

### Quickstart

```bash
git clone https://github.com/Cyfrin/foundry-fund-me-f23
cd foundry-fund-me-f23
forge build

Test Coverage
forge coverage

Scripts
After deploying to a testnet or local net, you can run the scripts.
Using cast deployed locally example: 
cast send <FUNDME_CONTRACT_ADDRESS> "fund()" --value 0.1ether --private-key <PRIVATE_KEY>
Estimate Gas
You can estimate how much gas things cost by running:
forge snapshot
And you'll see an output file called .gas-snapshot.
Formatting
To run code formatting:
forge fmt
Thank You
