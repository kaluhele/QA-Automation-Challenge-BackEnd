function fn() {
    var config = {};

    config.baseUrl = 'https://serverest.dev';

    config.randomEmail = function () {
        return 'user_' + java.util.UUID.randomUUID() + '@test.com';
    };

    config.randomName = function () {
        return 'User_' + java.util.UUID.randomUUID();
    };

    return config;
}