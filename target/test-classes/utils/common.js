{
    randomEmail: function() {
        var Faker = Java.type('com.github.javafaker.Faker');
        var faker = new Faker();
        var name = faker.name().firstName().toLowerCase();
        var num = Math.floor(Math.random() * 9000) + 1000;
        var domains = ['gmail.com', 'hotmail.com', 'yahoo.com', 'outlook.com'];
        var domain = domains[Math.floor(Math.random() * domains.length)];
        return name + num + '@' + domain;
    },

    randomName: function() {
        var Faker = Java.type('com.github.javafaker.Faker');
        var faker = new Faker();
        return faker.name().fullName();
    },

    randomPassword: function() {
        var Faker = Java.type('com.github.javafaker.Faker');
        var faker = new Faker();
        return faker.internet().password(8, 12, true, true, true);
    }
}