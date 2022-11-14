import { ethers, hardhatArguments, run } from "hardhat";
import { getIMXAddress, getEnv, sleep } from "./utils";

async function main() {
    const [deployer] = await ethers.getSigners();

    console.log("Deploying Contract with the account:", deployer.address);
    console.log("Account Balance:", (await deployer.getBalance()).toString());

    if (!hardhatArguments.network) {
        throw new Error("please pass --network");
    }

    const Asset = await ethers.getContractFactory("AssetFactory");
    const asset = await Asset.deploy();
    console.log("Deployed Contract Address:", asset.address);
    console.log('Verifying contract in 3 minutes...');
    await sleep(60000 * 3);
    await run("verify:verify", {
        address: asset.address,
        // constructorArguments: [],
    });
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
