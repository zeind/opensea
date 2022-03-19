require('dotenv').config();

async function main () {

    filter = {
        address: "0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266",
        topics: [
            ethers.utils.id("Transfer(address,address,uint256)"),
            null,
            ethers.utils.hexZeroPad("0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266", 32)
        ]
    };


}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  })