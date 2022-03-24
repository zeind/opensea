import 'dotenv/config';
import {OpenSeaPort, Network} from 'opensea-js';
// import HDWalletProvider from '@truffle/hdwallet-provider';

async function main () {
    const provider = web3.currentProvider;
    const seaport = new OpenSeaPort(provider, {
        networkName: Network.Rinkeby,
        apiKey: ""
    });

    const sellOrders = await seaport.createFactorySellOrders({
      assets: [
        {
          tokenId: "0",
          tokenAddress: process.env.FACTORY_CONTRACT_ADDRESS,
        },
      ],
      accountAddress: process.env.PUBLIC_KEY,
      startAmount: 0.04,
      numberOfOrders: 10 // Will create 100 sell orders in parallel batches to speed things up
    })

    console.log(sellOrders);
    // const asset = await seaport.api.getAsset({
    //     tokenAddress: process.env.FACTORY_CONTRACT_ADDRESS, 
    //     tokenId: 0,
    //   });

    // console.log("asset: ", asset);

}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  })