// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract eAST is ERC20, ERC20Capped, ERC20Burnable, AccessControl {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    constructor()
        ERC20("Alpha Struct Energy", "eAST")
        ERC20Capped(100_000_000_000 * (10**decimals()))
    {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(MINTER_ROLE, msg.sender);
    }

    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(to, amount);
    }

    function _update(address from, address to, uint256 value)
        internal
        override(ERC20, ERC20Capped)
    {
        super._update(from, to, value);
    }

    function withdrawStrayBNB(address payable to) external onlyRole(DEFAULT_ADMIN_ROLE) {
        require(to != address(0), "Cannot transfer to zero address");
        to.transfer(address(this).balance);
    }

    function withdrawStrayTokens(address tokenAddress, address to, uint256 amount) external onlyRole(DEFAULT_ADMIN_ROLE) {
        IERC20 token = IERC20(tokenAddress);
        require(address(token) != address(this), "Cannot withdraw self");
        require(to != address(0), "Cannot transfer to zero address");
        uint256 balance = token.balanceOf(address(this));
        require(amount <= balance, "Amount exceeds balance");
        require(token.transfer(to, amount), "Token transfer failed");
    }

    receive() external payable {}
} 