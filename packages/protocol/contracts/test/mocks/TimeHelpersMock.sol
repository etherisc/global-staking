// SPDX-License-Identifier: Apache-2.0
// SPDX-License-Identifier: Apache-2.0
pragma solidity 0.8.6;

import "../../lib/os/TimeHelpers.sol";


contract TimeHelpersMock is TimeHelpers {

    uint256 public mockedTimestamp;
    uint256 public mockedBlockNumber;

    /**
    * @dev Sets a mocked timestamp value, used only for testing purposes
    */
    function mockSetTimestamp(uint256 _timestamp) external {
        mockedTimestamp = _timestamp;
    }

    /**
    * @dev Increases the mocked timestamp value, used only for testing purposes
    */
    function mockIncreaseTime(uint256 _seconds) external {
        if (mockedTimestamp != 0) mockedTimestamp = mockedTimestamp + _seconds;
        else mockedTimestamp = block.timestamp + _seconds;
    }

    /**
    * @dev Decreases the mocked timestamp value, used only for testing purposes
    */
    function mockDecreaseTime(uint256 _seconds) external {
        if (mockedTimestamp != 0) mockedTimestamp = mockedTimestamp - _seconds;
        else mockedTimestamp = block.timestamp - _seconds;
    }

    /**
    * @dev Advances the mocked block number value, used only for testing purposes
    */
    function mockAdvanceBlocks(uint256 _number) external {
        if (mockedBlockNumber != 0) mockedBlockNumber = mockedBlockNumber + _number;
        else mockedBlockNumber = block.number + _number;
    }

    /**
    * @dev Returns the mocked timestamp value
    */
    function getTimestampPublic() external view returns (uint64) {
        return getTimestamp64();
    }

    /**
    * @dev Returns the mocked block number value
    */
    function getBlockNumberPublic() external view returns (uint256) {
        return getBlockNumber();
    }

}
