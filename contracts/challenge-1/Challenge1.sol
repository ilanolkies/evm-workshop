// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.9;

contract Challenge1 {
  /** 
  
    Quadratic formula!

             -b +- sqrt(b*b - 4*a*c)
    x1,x2 =  -----------------------
                      2a
  
   */
  function quadraticFunction(int256 a, int256 b, int256 c) external pure returns (int256 x1, int256 x2) {
    
    assembly {
      // Helper function for square root!
      function sqrt(n) -> y {
        let z := div(add(n,1),2)
        y := n

        for {} lt(z, y) {} {
          y := z
          z := div(div(n,add(z,z)),2)
        }
      } 

      // Write your code here
      let s := sub(mul(b, b), mul(mul(4, a), c))
      let num1 := add(sub(0, b), s)
      let num2 := sub(sub(0, b), s)

      x1 := div(num1, mul(2, a))
      x2 := div(num1, mul(2, a))
    }

    return (x1,x2);
  }
}