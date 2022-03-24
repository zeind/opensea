import 'dotenv/config';
import {OpenSeaPort, Network} from 'opensea-js';

async function main () {
    // const provider = await .getDefaultProvider();
    // const seaport = new OpenSeaPort(provider, {
    //     networkName: Network.Rinkeby,
    //     apiKey: ""
    // })

    // const asset = await seaport.api.getAsset({
    //     tokenAddress: process.env.FACTORY_CONTRACT_ADDRESS, 
    //     tokenId: 0,
    //   });

    // console.log("asset: ", asset);

    console.log(web3.eth.getAccounts());


}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  })