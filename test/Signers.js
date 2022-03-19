const assert = require('assert');

describe("Num signers", () => {
    it("Number of signers should be 20", async () => {
        const signers = await ethers.getSigners();
        assert.equal(signers.length, 20);
    })
})
