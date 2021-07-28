// Modules to control application life and create native browser window
const electron = require('electron');
const path = require('path');
const url = require('url');
const isPortReachable = require('is-port-reachable');


function port (){
    (async () => {
        console.log(await isPortReachable(465,995, 8465, 8995, 9999, 4443, {host: 'localhost'}));
        //=> true
      })();
}
