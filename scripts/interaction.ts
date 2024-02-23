import { ethers } from "hardhat";
import { IVotingFactory } from "../typechain-types";

async function main() {
    const votingFactory = "0x2727682A34e1B3a7F7Ce9bB0bEB6B09880A16351";
    const VOTINGFACTORY = await ethers.getContractAt("IVotingFactory", votingFactory);

    const createCloneTx = await VOTINGFACTORY.createVotingClone("Cartesi");

    await createCloneTx.wait();

    const clones = await VOTINGFACTORY.getVotingClones();
    console.log(clones);
    
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });
  