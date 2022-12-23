const globalRequestProxy = require('node-global-proxy').default
globalRequestProxy.setConfig(process.env.NODE_GLOBAL_PROXY)
globalRequestProxy.start()

require('/qqcibuild/orange.js')