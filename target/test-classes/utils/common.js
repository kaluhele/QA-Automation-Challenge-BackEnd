function fn() {

    return {
        randomEmail: function() {
            return 'user_' + java.util.UUID.randomUUID() + '@test.com';
        },

        randomName: function() {
            return 'User_' + java.util.UUID.randomUUID();
        }
    };

}