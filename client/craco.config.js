const CracoLessPlugin = require('craco-less');
console.log('craco webpac loaded')
module.exports = {
    plugins: [
        {
            plugin: CracoLessPlugin,
            options: {
            lessLoaderOptions: {
                lessOptions: {
                modifyVars: { 
                                '@primary-color': '#27AD95',
                                '@secondary-color': 'white'
                            },
                javascriptEnabled: true,
                },
            },
            },
        },
    ],
};