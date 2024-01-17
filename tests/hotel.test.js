/* eslint-disable no-undef */
// Right click on the script name and hit "Run" to execute
const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("hotelBooking", function () {
  it("test initial value", async function () {
    const hotelBooking = await ethers.getContractFactory("hotelBooking");
    const hotel = await hotelBooking.deploy();
    await hotel.deployed();
    console.log("hotel deployed at:" + hotel.address);
    expect((await hotel.nbOfRooms()).toNumber()).to.equal(3);
  });
});
