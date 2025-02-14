// SPDX-License-Identifier: Apache-2.0
pragma solidity 0.8.6;

import "../../locking/ILockManager.sol";
import "../../Staking.sol";


contract LockManagerMock is ILockManager {
    bool result;

    function lock(Staking _staking, address _user, uint256 _amount) external {
        _staking.lock(_user, _amount);
    }

    function slash(Staking _staking, address _from, address _to, uint256 _amount) external {
        _staking.slash(_from, _to, _amount);
    }

    function slashAndUnstake(Staking _staking, address _from, address _to, uint256 _amount) external {
        _staking.slashAndUnstake(_from, _to, _amount);
    }

    function unlock(Staking _staking, address _account, uint256 _amount) external {
        _staking.unlock(_account, address(this), _amount);
    }

    function unlockAndRemoveManager(Staking _staking, address _account) external {
        _staking.unlockAndRemoveManager(_account, address(this));
    }

    function canUnlock(address, uint256) external override view returns (bool) {
        return result;
    }

    function setResult(bool _result) public {
        result = _result;
    }

    function unlockAndRemoveManager(Staking _staking, address _account, address _manager) public {
        _staking.unlockAndRemoveManager(_account, _manager);
    }
}
