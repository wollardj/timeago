###
    This helper provides a template as well as a global template helper. Both
    can be used to display a date using `momentjs`'s `fromNow` method. The
    template will automatically refresh the output once every 20 seconds so that
    results like _a few seconds ago_ will become _about a minute ago_
    automatically.

    To use the template, just pass in a date when you include it:

    ```
    {{> timeago date=someDateVariable}}
    ```

    The global template helper `momentDuration` provides non-reactive results
    because its goal is slightly different. As the name implies, it only
    produces a `duration` that's calculated between two dates using `momentjs`'s
    `diff` and `duration` methods. Usage:

    {{timeagoDuration start=date1 end=date2}}
###

TIMEAGO_REFRESH = new ReactiveVar(new Date())
TIMEAGO_INTERVAL = null
TIMEAGO_MS = 20000


Template.registerHelper 'timeagoDuration', (start, end)->
    diff = moment(end).diff(start)
    moment.duration(diff).humanize()


Template.registerHelper 'timeagoDurationRaw', (start, end)->
    moment(end).diff(start)


Template.timeago.created = ->

    this.uuid = Meteor.uuid()

    # only setup the interval if it hasn't been done already - we don't want
    # or expect one timer for every template instance.
    unless TIMEAGO_INTERVAL
        TIMEAGO_INTERVAL = Meteor.setInterval ->
            TIMEAGO_REFRESH.set new Date()
        , TIMEAGO_MS



Template.timeago.rendered = ->
    # Since the `fromNow` method can be unhelpful when you need to know the
    # exact date in question, the template makes that value available in a
    # tooltip. Here, we dressup that tooltip a bit using Bootstrap's `tooltip`,
    # as long as bootstrap's tooltip() method is available.
    try
        $('#' + this.uuid).tooltip()
    catch e
        # do nothing and fallback to the traditional tool-tip functionality


Template.timeago.helpers {
    uuid: ->
        Template.instance()?.uuid

    formatted: ->
        # get the TIMEAGO_REFRESH value so that when that variable gets updated
        # on on its interval, we'll update the fromNow() output as well.
        r = TIMEAGO_REFRESH.get()
        date = Template.currentData() #?.date
        moment(date).fromNow()
}
