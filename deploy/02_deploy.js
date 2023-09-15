const hre = require("hardhat");

async function main() {

  // Get contract file
  const ContractFactory = await hre.ethers.getContractFactory("MyToken");

  //Pay attention to the deploy parameters here.
  //You must fill in the same values when authenticating the contract later,
  //otherwise the following error will be reported.
  //Successfully submitted source code for contract
  //contracts/ApeAscii.sol:ApeAscii at 0x7B5b01aaBf8869C45C4A0ec175247FdE8DDF5CB8
  //for verification on the block explorer. Waiting for verification result...
  //Error in plugin @nomiclabs/hardhat-etherscan: The contract verification failed.
  //Reason: Fail - Unable to verify
  const contract = await ContractFactory.deploy();

  // Deploy start
  await contract.deployed();
  // Console result
  console.log("contract deployed to:", contract.address);
}

main().then(() => {
  process.exit(0)
}).catch(error => {
  console.error(error);
  process.exit(1);
});
