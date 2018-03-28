var Migrations = artifacts.require("./Migrations.sol");
var zeropad = require('zeropad');

module.exports = function(deployer) {
  deployer.deploy(Migrations);
};
