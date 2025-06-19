const cds = require('@sap/cds');
const { name } = require('@sap/cds/lib/req/cds-context');

class HelloService extends cds.ApplicationService{
    
    sayHello(name) {return "Hello " + name;}
}

module.exports = HelloService;