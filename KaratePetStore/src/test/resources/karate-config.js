function fn() {
    karate.configure('headers', { accept: 'application/json' });

    return {
        utils: karate.call('classpath:karate-utils.js'),
        baseUrl: 'https://petstore3.swagger.io/api/v3'
    };
}