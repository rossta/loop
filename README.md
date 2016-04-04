# README

This README would normally document whatever steps are necessary to get the application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Development

```
$ bundle
$ cp config/database.yml.example config/database.yml
$ cp config/redis.yml.example config/redis.yml
$ cp .envrc.example .envrc
```

## Sending updates

Users set up "accounts" linked to social networks, e.g. Twitter, and "channels", e. g. #tech, for distributing content in the form of individual "posts".

User create posts and may assign them to channels for recurring distribution and
for delivery for specific timeslots.

Channels have, and belong to, many accounts. Channels represent a queue of
posts that will loop on repeat until or unless otherwise specified.

Users establish "schedules" for each channel. A schedule consists of one (or more?) recurrence rule(s), i.e., every day at 2pm, and the channel from which to pull content.

Channels have many schedules.

An hourly? job is run to iterate over all channels and determine if any jobs
should be run in the upcoming hour?. If a recurrence rule overlaps with the
upcoming time interval, a "timeslot" record is created for that channel.

A timeslot belongs to a channel schedule or specific post. It represents a one-time job to publish a
single post - either the post it is associated with directly or the "next post" from channel.

A timeslot has a publish timestamp and a token. When a timeslot is created,
it enqueues a job to be run at a specific time (the publish timestamp). The job receives the
timeslot's token when enqueued. If timeslot's publish timestamp is edited a new job is a
generated with a new token. For a timeslot job to succeed, its token must match the current timeslot token.
Previously-enqueued jobs will no-op since their tokens will not match current token of the timeslot.
(This technique makes it unnecessary to delete jobs from a Sidekiq, an O(n) operation). If the
timeslot is deleted, the job will also no-op. When the post is successfully sent, the timeslot is
marked as published and the post it published is recorded.

When a schedule is edited, existing, unpublished timeslots must be examined to determine if they are
still consistent with the schedule's recurrence rules. (Either they get updated or
deleted/regenerated).
