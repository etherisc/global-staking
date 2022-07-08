// See MiniMe token (https://github.com/Giveth/minime/blob/master/contracts/MiniMeToken.sol)

// SPDX-License-Identifier: Apache-2.0
pragma solidity 0.8.6;


interface IApproveAndCallFallBack {
    function receiveApproval(
        address from,
        uint256 _amount,
        address _token,
        bytes calldata _data
    ) external;
}
