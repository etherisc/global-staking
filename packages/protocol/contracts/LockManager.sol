// SPDX-License-Identifier: Apache-2.0
pragma solidity 0.8.6;

import "./locking/ILockManager.sol";
import "./Staking.sol";


contract LockManager is ILockManager, Ownable {

    bool public withSlashing;

    modifier onlyWithSlashing {
        require(withSlashing, "ERROR: No Slashing allowed");
        _;
    }

    constructor (bool _withSlashing) {
        withSlashing = _withSlashing;
    }

    function lock(Staking _staking, address _user, uint256 _amount)
        external
        onlyOwner
    {
        _staking.lock(_user, _amount);
    }

    function slash(Staking _staking, address _from, address _to, uint256 _amount)
        external
        onlyOwner
        onlyWithSlashing
    {

        _staking.slash(_from, _to, _amount);
    }

    function slashAndUnstake(Staking _staking, address _from, address _to, uint256 _amount)
        external
        onlyOwner
        onlyWithSlashing
    {
        _staking.slashAndUnstake(_from, _to, _amount);
    }

    function unlock(Staking _staking, address _account, uint256 _amount)
        external
        onlyOwner
    {
        _staking.unlock(_account, address(this), _amount);
    }

    function unlockAndRemoveManager(Staking _staking, address _account)
        external
        onlyOwner
    {
        _staking.unlockAndRemoveManager(_account, address(this));
    }

    function canUnlock(address, uint256)
        external override view
        onlyOwner
        returns (bool) {
        // only Owner of LockManager can unlock
        return false;
    }

    function unlockAndRemoveManager(Staking _staking, address _account, address _manager)
        external
        onlyOwner
    {
        _staking.unlockAndRemoveManager(_account, _manager);
    }
}
