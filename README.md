# eAST (Alpha Struct Energy)

eAST is an ERC20 token with a fixed supply cap, burnable features, and role-based access control.

## Overview

This smart contract implements an ERC20 token named "Alpha Struct Energy" with the symbol "eAST". It inherits from OpenZeppelin's contracts to provide a standard, secure, and feature-rich token.

## Features

- **ERC20 Standard**: Compliant with the ERC20 token standard.
- **Capped Supply**: The total supply of eAST is capped at 100,000,000,000 tokens. No more tokens can be minted once this cap is reached.
- **Burnable**: Token holders can burn (destroy) their tokens, effectively reducing the total supply.


## Functions

### Public Functions

- `mint(address to, uint256 amount)`: Mints new tokens to a specified address. Only accounts with the `MINTER_ROLE` can call this function.


## Contract Details

- **Name**: Alpha Struct Energy
- **Symbol**: eAST
- **Decimals**: 18
- **Max Supply**: 100,000,000,000 eAST

## Development

This project uses Hardhat for development and testing.