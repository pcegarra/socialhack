require('dotenv').config();
import express from 'express';
const yn = require('yn');
const ParseServer = require('parse-server').ParseServer;
const ParseDashboard = require('parse-dashboard');

let development: boolean = process.env.PUBLIC_URL ? process.env.PUBLIC_URL.indexOf('localhost') !== -1 : false;
let app = express();

/**
 * Adaptador de parse para correos SMTP
 */
let smtpEmailAdapter = {
    module: 'simple-parse-smtp-adapter',
    options: {
        fromAddress: process.env.MAIL_ADDRESS,
        user: process.env.MAIL_USER,
        password: process.env.MAIL_PASSWORD,
        host: process.env.SMTP_HOST,
        isSSL: yn(process.env.SMTP_SSL),
        isTlsRejectUnauthorized: false,
        port: process.env.SMTP_PORT
    }
};

/**
 * Configuración de los mensajes push.
 */
let pushConfig: any = {};
if (process.env.PUSH_GCM_SENDER_ID) {
    pushConfig.android = {
        apiKey: process.env.PUSH_GCM_KEY,
        senderId: process.env.PUSH_GCM_SENDER_ID,
    };
} else {
    console.log("No Android push config");
}
if (process.env.PUSH_IOS_BUNDLE_ID) {
    pushConfig.ios = [
        {
            topic: process.env.PUSH_IOS_BUNDLE_ID,
            pfx: process.env.PUSH_IOS_CERTFILE_DEV,
            production: false
        },
        {
            topic: process.env.PUSH_IOS_BUNDLE_ID,
            pfx: process.env.PUSH_IOS_CERTFILE,
            production: true
        },
    ];
} else {
    console.log("No iOS push config");
}

/**
 * Autenticación con terceros.
 */
let thirdPartyAuthConfig = {
};

/**
 * Custom pages.
 */
let customPages = {
};

/**
 * Called when cloud is ready to run
 */
function cloudCallback() {
    require(__dirname + '/cloud');
}

// noinspection JSUnusedGlobalSymbols
/**
 * API endpoint
 */
let api1 = new ParseServer({
    databaseURI: process.env.DB_URI,
    serverURL: process.env.PUBLIC_URL,
    publicServerURL: process.env.PUBLIC_URL,
    cloud: cloudCallback,
    appName: process.env.APP_NAME,
    appId: process.env.APP_ID,
    fileKey: process.env.FILE_KEY,
    masterKey: process.env.MASTER_KEY,
    filesAdapter: "@parse/fs-files-adapter",
    emailAdapter: smtpEmailAdapter,
    verifyUserEmails: true,
    push: pushConfig,
    auth: thirdPartyAuthConfig,
    customPages: customPages,
});



/**
 * Declaración de apps xestionadas por este backend (só vai ser unha).
 */
let dashboardApps = [
    {
        serverURL: process.env.PUBLIC_URL,
        appId: process.env.APP_ID,
        masterKey: process.env.MASTER_KEY,
        appName: process.env.APP_NAME,
        iconName: process.env.DASHBOARD_ICON,
        production: !development,
    }
];

/**
 * Dashboard propio desde backend.
 */
let dashboard = new ParseDashboard({
    trustProxy: 1,
    apps: dashboardApps,
    iconsFolder: '.',
    users: [
        {
            user: "admin",
            pass: process.env.DASHBOARD_ADMIN_PASSWORD
        }
    ]
}, {allowInsecureHTTP: true});

/**
 * Rutas y módulos.
 */
app.use('/' + process.env.API_URL_PREFIX, api1);
app.use('/' + process.env.DASHBOARD_URL_PREFIX, dashboard);

/**
 * Puesta en marcha del servidor.
 */
app.listen(process.env.PORT, function() {
    if (development) {
        console.log("DEVELOPMENT MODE ENABLED")
    }
    console.log('Backend for ' + process.env.APP_NAME + ' ready on port ' + process.env.PORT);
});




