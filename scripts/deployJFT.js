require('dotenv').config();

async function main () {

    const NFT = await ethers.getContractFactory('JFT');

    console.log('Deploying NFT..');

    const nft = await NFT.deploy(process.env.PROXY_REG_ADDRESS);
    await nft.deployed();
    console.log('Nft deployed to: ', nft.address);

}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  })