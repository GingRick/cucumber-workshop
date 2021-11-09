'use strict';

const apickli = require('apickli');
const {Before, setDefaultTimeout} = require('@cucumber/cucumber');

Before(function() {
  this.apickli = new apickli.Apickli('https', 'api-dev1.dinersclub.tech.ec/v1/integracion');
  this.apickli.addRequestHeader('Cache-Control', 'no-cache');
  this.apickli.addRequestHeader('Authorization', 'Bearer 7Wyi5KTjFutKaCAMxeXKG9JwkgH5');
});

setDefaultTimeout(60 * 1000);



//this.apickli.clientTLSConfig = {
  //  valid: {
    //  key: './test/mock_target/certs/client-key.pem',
      //cert: './test/mock_target/certs/client-crt.pem',
      //ca: './test/mock_target/certs/ca-crt.pem',
    //},
  //};