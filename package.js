Package.describe({
    name: 'wollardj:timeago',
    summary: 'Meteor wrapper for the momentjs fromNow() method.',
    version: '1.2.0',
    git: 'https://github.com/wollardj/timeago.git'
});

Package.onUse(function(api) {
    api.versionsFrom('1.0.2.1');
    api.use([
        'coffeescript',
        'templating',
        'reactive-var',
        'momentjs:moment@2.11.0'
    ]);
    api.addFiles([
            'wollardj:timeago.html',
            'wollardj:timeago.coffee'
        ],
        'client'
    );
});
