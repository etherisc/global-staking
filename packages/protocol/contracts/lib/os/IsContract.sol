// SPDX-License-Identifier: Apache-2.0

// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.6;


contract IsContract {
    /*
    * NOTE: this should NEVER be used for authentication
    * (see pitfalls: https://github.com/fergarrui/ethereum-security/tree/master/contracts/extcodesize).
    *
    * This is only intended to be used as a sanity check that an address is actually a contract,
    * RATHER THAN an address not being a contract.
    */
    function isContract(address _target) public view returns (bool) {
        return _target.code.length > 0;
    }
}
