// SPDX-License-Identifier: Apache-2.0
pragma solidity 0.8.6;

import "./IStaking.sol";


interface IStakingFactory {
    function getOrCreateInstance(/* ERC20 */ address token) external returns (IStaking);

    function existsInstance(/* ERC20 */ address token) external view returns (bool);
    function getInstance(/* ERC20 */ address token) external view returns (IStaking);
}
