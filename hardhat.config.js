/**
* @type import('hardhat/config').HardhatUserConfig
*/
require('dotenv').config();
require("@nomiclabs/hardhat-ethers");
require("@nomiclabs/hardhat-web3");
const { API_URL, PRIVATE_KEY } = process.env;
module.exports = {
   solidity: "0.8.1",
   defaultNetwork: "localhost",
   networks: {
      hardhat: {},
      rinkeby: {
         url: API_URL,
         accounts: [`0x${PRIVATE_KEY}`]
      }
   },
}