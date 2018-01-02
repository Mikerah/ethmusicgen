var MusicGenerator = artifacts.require("MusicGenerator");

module.exports = function(deployer) {
    deployer.deploy(MusicGenerator);
};