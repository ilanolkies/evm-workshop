// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.9;

contract Input {
    function startChallenge() external {
        assembly {
            sstore(1, 0x9)
            sstore(2, 0x3)
            sstore(3, 0x2)
            sstore(4, 0x1)
            sstore(5, 0xA)
            sstore(6, 0x5)
            sstore(7, 0x4)
            sstore(8, 0x8)
            sstore(9, 0x6)
            sstore(10, 0x7)
        }
    }

    function checkSolution() external view returns (bool) {
        uint8 n1; 
        uint8 n2; 
        uint8 n3;
        uint8 n4;
        uint8 n5;
        uint8 n6;
        uint8 n7;
        uint8 n8;
        uint8 n9;
        uint8 n10;

        assembly {
            n1 := sload(1)
            n2 := sload(2)
            n3 := sload(3)
            n4 := sload(4)
            n5 := sload(5)
            n6 := sload(6)
            n7 := sload(7)
            n8 := sload(8)
            n9 := sload(9)
            n10 := sload(10)
        }   

        return n1 == 1 && n2 == 2 && n3 == 3 && n4 == 4 && n5 == 5 && n6 == 6
            && n7 == 7 && n8 == 8 && n9 == 9 && n10 == 10;
    }

}