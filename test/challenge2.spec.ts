import { expect } from "chai";
import { ethers } from "hardhat";

describe("Solution", function () {
  describe("Check if the solution is correct", function () {
    it("Should retrieve the storage sorted", async function () {
      const challengeFactory = await ethers.getContractFactory("Challenge2");
      const challengeContract = await challengeFactory.deploy();

      await challengeContract.deployed();

      expect(await challengeContract.checkSolution()).to.be.equals(false);

      const storage = await challengeContract.checkStorage();

      expect(storage[0]).to.be.equals(0);
      expect(storage[1]).to.be.equals(0);
      expect(storage[2]).to.be.equals(0);
      expect(storage[3]).to.be.equals(0);
      expect(storage[4]).to.be.equals(0);
      expect(storage[5]).to.be.equals(0);
      expect(storage[6]).to.be.equals(0);
      expect(storage[7]).to.be.equals(0);
      expect(storage[8]).to.be.equals(0);
      expect(storage[9]).to.be.equals(0);

      await expect(challengeContract.solution()).to.be.not.reverted;

      const storageAfterSolution = await challengeContract.checkStorage();

      expect(storageAfterSolution[0]).to.be.equals(1);
      expect(storageAfterSolution[1]).to.be.equals(2);
      expect(storageAfterSolution[2]).to.be.equals(3);
      expect(storageAfterSolution[3]).to.be.equals(4);
      expect(storageAfterSolution[4]).to.be.equals(5);
      expect(storageAfterSolution[5]).to.be.equals(6);
      expect(storageAfterSolution[6]).to.be.equals(7);
      expect(storageAfterSolution[7]).to.be.equals(8);
      expect(storageAfterSolution[8]).to.be.equals(9);
      expect(storageAfterSolution[9]).to.be.equals(10);

      expect(await challengeContract.checkSolution()).to.be.equals(true);
    });
  });
});
