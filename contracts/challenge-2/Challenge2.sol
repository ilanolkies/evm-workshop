// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.9;

import "./Input2.sol";

contract Challenge2 {
    Input input;

    constructor() {
        input = new Input();
    }

    function solution() external returns (bool) {
        address inputContractAddr;
        assembly {
            inputContractAddr       := sload(9999) // TODO: Replace 9999 with correct slot
        }
        // Fill the storage using the Input contract's startChallenge function
        // If all is correct your initial storage should look like this:
        // slot[0] = n0
        // slot[1] = n1
        // ...
        // slot[9] = n_max
        bytes memory sig = abi.encodeWithSignature("startChallenge()");  //Function signature
        assembly {
            let arguments           := mload(0x40) // 0x40: free memory pointer
            mstore(arguments, sig)
            let argsOffset          := sub(arguments, 0x4)

            let suc := delegatecall(
                1000000,
                inputContractAddr,
                argsOffset,
                0x4,
                argsOffset,
                0x1
            )
        }

        // Sort the storage
        // If all is correct your final storage should look like this:
        // slot[0] = n0
        // ...
        // slot[9] = n_max
        assembly {
            // TODO: Implement a sort algorithm, suggestion: bubble sort!
        }

        // Check if the solution is correct!
        (bool success, bytes memory data) = inputContractAddr.delegatecall(
            abi.encodeWithSignature("checkSolution()")
        );

        if (success) {
            bool isCorrectAnswer = abi.decode(data, (bool));
            bytes4 key = bytes4(keccak256("focus.on.the.challenge"));

            assembly {
                sstore(key, isCorrectAnswer)
            }
        }

        return false;
    }


    // ---------------------------
    //      HELPER FUNCTIONS
    // ---------------------------

    function checkStorage()
        external
        view
        returns (
            uint8 s1,
            uint8 s2,
            uint8 s3,
            uint8 s4,
            uint8 s5,
            uint8 s6,
            uint8 s7,
            uint8 s8,
            uint8 s9,
            uint8 s10
        )
    {
        assembly {
            s1 := sload(1)
            s2 := sload(2)
            s3 := sload(3)
            s4 := sload(4)
            s5 := sload(5)
            s6 := sload(6)
            s7 := sload(7)
            s8 := sload(8)
            s9 := sload(9)
            s10 := sload(10)
        }
    }

    function checkSolution() external view returns (bool hasWon) {
        bytes4 key = bytes4(keccak256("focus.on.the.challenge"));
        assembly {
            hasWon := sload(key)
        }
    }
}
