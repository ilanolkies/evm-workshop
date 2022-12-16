import { expect } from "chai";
import { ethers } from "hardhat";

describe("Solution 1", () => {
  describe("Test quadratic function", () => {
    it("should calculate the quadratic function of x^2-4x+4", async () => {
      const challengeFactory = await ethers.getContractFactory("Challenge1");
      const challengeContract = await challengeFactory.deploy();

      await challengeContract.deployed();

      const results = await challengeContract.quadraticFunction(1, -4, 4);

      expect(results.x1).to.be.equals(2);
      expect(results.x2).to.be.equals(2);
    });
  });
});
