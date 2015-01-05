timeago
=======

A Meteor wrapper for the momentjs fromNow() method which
periodically updates the template output.

## Using the `timeago` Template

If you've got a date object, you've got enough data to use the `timeago` template helper. Here's a quick example:

### myTpl.js

    Template.myTpl.helpers({
        'createdOn': function() {
            return new Date();
        }
    });


### myTpl.html

    <template name="myTpl">
        {{>timeago createdOn}}
    </template>


## Using the `duration` Template Helper

This package also includes a global template helper called
`duration`. The only thing this does is pass two dates through
momentjs's `diff` method. In order to do this you need a starting date, ending date, and a unit of time to output. For example:

    {{duration startDate endDate 'seconds'}}
