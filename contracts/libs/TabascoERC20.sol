// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import "../interfaces/ITabascoERC20.sol";
import "../utils/SafeMath.sol";

contract TabascoERC20 is ITabascoERC20 {
    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowances;
    uint256 private _totalSupply;
    string private constant _name = "Tabasco Shots";
    string private _symbol = "TSHOT";
    
    function name() external pure returns (string memory) {
        return _name;
    }

    function symbol() external view returns (string memory){
        return _symbol;
    }

    function decimals() external pure returns (uint8) {
        return 18;
    }

    function totalSupply() external view returns (uint256){
        return _totalSupply;
    }

    function balanceOf(address account) external view returns (uint256){
        return _balances[account];
    }

    function allowance(address owner, address spender) external view returns (uint256){
        return _allowances[owner][spender];
    }
    function approve(address spender, uint256 amount) external returns (bool){
        address owner = msg.sender;
        _approve(owner, spender, amount);
        return true;
    }

    function _approve(address _owner, address _spender, uint256 _amount) internal virtual {
        require(_owner != address(0), "[TabascoERC20]: Approval from address(0)");
        require(_spender != address(0), "[TabascoERC20]: Approval from address(0)");
        _allowances[_owner][_spender] = _amount;
        emit Approval(_owner, _spender, _amount);
    }

    function transfer(address recipient, uint256 amount) external returns (bool){}
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool){}

    

}