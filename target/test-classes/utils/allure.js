{
    attachRequest: function(name, data) {
        var Allure = Java.type('io.qameta.allure.Allure');
        Allure.addAttachment(name, 'application/json',
            JSON.stringify(data, null, 2));
    },
    attachResponse: function(name, data) {
        var Allure = Java.type('io.qameta.allure.Allure');
        Allure.addAttachment(name, 'application/json',
            JSON.stringify(data, null, 2));
    }
}