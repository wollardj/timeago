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


## Using the `timeagoDuration` Template Helper

This package also includes a global template helper called
`timeagoDuration`. The only thing this does is pass two dates through
momentjs's `diff` method and then through `duration`. In order to do this you
need a starting date and ending date. For example:

    {{timeagoDuration startDate endDate}}

This might yield something like `a few seconds`. If you want the raw milliseconds, call `timeagoDurationRaw` instead:

    {{timeagoDurationRaw startDate endDate}}
